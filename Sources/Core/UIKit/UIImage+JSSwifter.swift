//
//  UIImage+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIImage {
    
    // MARK:
    var bytes: Int {
        return self.jpegData(compressionQuality: 1.0)?.count ?? 0
    }
    
    var kilobytes: Int {
        return self.bytes / 1024
    }
    
    var original: UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
    
    var template: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    // MARK:
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        defer {
            UIGraphicsEndImageContext()
        }
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        guard let tmpCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: tmpCgImage)
    }
    
    // MARK:
    func cropped(to rect: CGRect) -> UIImage {
        guard rect.size.width < self.size.width, rect.size.height < self.size.height else {
            return self
        }
        guard let cgImage = self.cgImage?.cropping(to: rect) else {
            return self
        }
        return UIImage(cgImage: cgImage)
    }
    
    func scaled(toHeight: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toHeight / self.size.height
        let newWidth = self.size.width * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: toHeight), opaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: newWidth, height: toHeight))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func scaled(toWidth: CGFloat, opaque: Bool = false) -> UIImage? {
        let scale = toWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: toWidth, height: newHeight), opaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: toWidth, height: newHeight))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    @available(iOS 10.0, *)
    func rotated(by angle: Measurement<UnitAngle>) -> UIImage? {
        let radians = CGFloat(angle.converted(to: .radians).value)
        let destRect = CGRect(origin: .zero, size: self.size).applying(CGAffineTransform(rotationAngle: radians))
        let roundedDestRect = CGRect(x: destRect.origin.x.rounded(),
                                     y: destRect.origin.y.rounded(),
                                     width: destRect.width.rounded(),
                                     height: destRect.height.rounded())
        UIGraphicsBeginImageContext(roundedDestRect.size)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let contextRef = UIGraphicsGetCurrentContext() else {
            return nil
        }
        contextRef.translateBy(x: roundedDestRect.width / 2.0, y: roundedDestRect.height / 2.0)
        contextRef.rotate(by: radians)
        self.draw(in: CGRect(origin: CGPoint(x: -(self.size.width / 2.0), y: -(self.size.height / 2.0)), size: self.size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func rotated(by radians: CGFloat) -> UIImage? {
        let destRect = CGRect(origin: .zero, size: self.size).applying(CGAffineTransform(rotationAngle: radians))
        let roundedDestRect = CGRect(x: destRect.origin.x.rounded(),
                                     y: destRect.origin.y.rounded(),
                                     width: destRect.width.rounded(),
                                     height: destRect.height.rounded())
        UIGraphicsBeginImageContext(roundedDestRect.size)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let contextRef = UIGraphicsGetCurrentContext() else {
            return nil
        }
        contextRef.translateBy(x: roundedDestRect.width / 2.0, y: roundedDestRect.height / 2.0)
        contextRef.rotate(by: radians)
        self.draw(in: CGRect(origin: CGPoint(x: -(self.size.width / 2.0), y: -(self.size.height / 2.0)), size: self.size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func filled(_ color: UIColor) -> UIImage {
        let clipRect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        color.setFill()
        guard let contextRef = UIGraphicsGetCurrentContext() else {
            return self
        }
        contextRef.translateBy(x: 0.0, y: self.size.height)
        contextRef.scaleBy(x: 1.0, y: -1.0)
        contextRef.setBlendMode(.normal)
        guard let mask = self.cgImage else {
            return self
        }
        contextRef.clip(to: clipRect, mask: mask)
        contextRef.fill(clipRect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func tint(_ color: UIColor, blendMode: CGBlendMode = CGBlendMode.destinationIn) -> UIImage {
        let drawRect = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        color.setFill()
        UIRectFill(drawRect)
        self.draw(at: .zero, blendMode: blendMode, alpha: 1.0)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(self.size.width, self.size.height) / 2.0
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0.0, radius <= maxRadius {
            cornerRadius = radius
        }
        else {
            cornerRadius = maxRadius
        }
        
        let drawRect = CGRect(origin: .zero, size: self.size)
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        UIBezierPath(roundedRect: drawRect, cornerRadius: cornerRadius).addClip()
        self.draw(in: drawRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
