//
//  UIBezierPath+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIBezierPath {
    
    // MARK:
    static func bezierPath(with text: String, font: UIFont) -> UIBezierPath {
        let cgPath = CGMutablePath()
        
        let fontRef = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
        let attributes = [kCTFontAttributeName as NSAttributedString.Key: fontRef]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        
        let line = CTLineCreateWithAttributedString(attributedString)
        let runs = CTLineGetGlyphRuns(line)
        
        for idx in 0..<CFArrayGetCount(runs) {
            let run = unsafeBitCast(CFArrayGetValueAtIndex(runs, idx), to: CTRun.self)
            
            let theDict = CTRunGetAttributes(run)
            let key = unsafeBitCast(kCTFontAttributeName, to: UnsafeRawPointer.self)
            
            let runFont = unsafeBitCast(CFDictionaryGetValue(theDict, key), to: CTFont.self)
            
            for idx in 0..<CTRunGetGlyphCount(run) {
                let glyphRange = CFRangeMake(idx, 1)
                
                var glyph: CGGlyph = CGGlyph()
                var position: CGPoint = CGPoint.zero
                CTRunGetGlyphs(run, glyphRange, &glyph)
                CTRunGetPositions(run, glyphRange, &position)
                
                if let glyphPath = CTFontCreatePathForGlyph(runFont, glyph, nil) {
                    let transform = CGAffineTransform(translationX: position.x, y: position.y)
                    cgPath.addPath(glyphPath, transform: transform)
                }
            }
        }
        
        let path = UIBezierPath(cgPath: cgPath)
        path.apply(CGAffineTransform(translationX: -(cgPath.boundingBox.size.width), y: cgPath.boundingBox.size.height))
        
        return path
    }
}
