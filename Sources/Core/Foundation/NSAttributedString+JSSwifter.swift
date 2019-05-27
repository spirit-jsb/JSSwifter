//
//  NSAttributedString+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    
    // MARK:
    var bolded: NSAttributedString {
        return self.applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    var italicized: NSAttributedString {
        return self.applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    var underlined: NSAttributedString {
        return self.applying(attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    var strikethrough: NSAttributedString {
        return self.applying(attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
    }
    
    var attributes: [NSAttributedString.Key: Any] {
        guard self.length > 0 else { return [:] }
        return self.attributes(at: 0, effectiveRange: nil)
    }
    
    // MARK:
    func colored(with color: UIColor) -> NSAttributedString {
        return self.applying(attributes: [.foregroundColor: color])
    }
    
    func applying(attributes: [NSAttributedString.Key: Any], toRangesMatching pattern: String) -> NSAttributedString {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
        let matches = pattern.matches(in: self.string, options: [], range: NSRange(0..<self.length))
        let result = NSMutableAttributedString(attributedString: self)
        for match in matches {
            result.addAttributes(attributes, range: match.range)
        }
        return result
    }
    
    func applying<T: StringProtocol>(attributes: [NSAttributedString.Key: Any], toOccurrencesOf target: T) -> NSAttributedString {
        let pattern = "\\Q\(target)\\E"
        return self.applying(attributes: attributes, toRangesMatching: pattern)
    }
    
    // MARK:
    static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        lhs = string
    }
    
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let string = NSMutableAttributedString(attributedString: lhs)
        string.append(rhs)
        return NSAttributedString(attributedString: string)
    }
    
    static func += (lhs: inout NSAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
        return lhs + NSAttributedString(string: rhs)
    }
    
    // MARK:
    fileprivate func applying(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        let range = (self.string as NSString).range(of: self.string)
        copy.addAttributes(attributes, range: range)
        return copy
    }
}
