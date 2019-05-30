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
    
    /// 指定 UIImage 的字节大小
    var bytes: Int {
        return self.jpegData(compressionQuality: 1.0)?.count ?? 0
    }
    
    /// 指定 UIImage 的千字节大小
    var kilobytes: Int {
        return self.bytes / 1024
    }
    
    /// 指定 UIImage 以 .alwaysOriginal 模式呈现
    var original: UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
    
    /// 指定 UIImage 以 .alwaysTemplate 模式呈现
    var template: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    // MARK:
    
    /// 以给定颜色和尺寸初始化相应图像
    ///
    /// - Parameters:
    ///   - color: 图像填充颜色
    ///   - size: 图像填充尺寸，默认值为 CGSize(width: 1.0, height: 1.0)
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
    
    /// 将指定 UIImage 裁剪至给定 CGRect
    ///
    /// - Parameter rect:
    /// - Returns: 返回裁剪至给定 CGRect 后的 UIImage
    func cropped(to rect: CGRect) -> UIImage {
        guard rect.size.width < self.size.width, rect.size.height < self.size.height else {
            return self
        }
        guard let cgImage = self.cgImage?.cropping(to: rect) else {
            return self
        }
        return UIImage(cgImage: cgImage)
    }
    
    /// 将指定 UIImage 依据宽高比缩放至给定高度
    ///
    /// - Parameters:
    ///   - toHeight: 缩放图像至给定高度
    ///   - opaque: 图像是否透明，默认值为 false
    /// - Returns: 返回缩放后的可选 UIImage
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
    
    /// 将指定 UIImage 依据宽高比缩放至给定宽度
    ///
    /// - Parameters:
    ///   - toWidth: 缩放图像至给定宽度
    ///   - opaque: 图像是否透明，默认值为 false
    /// - Returns: 返回缩放后的可选 UIImage
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

    /// 将指定 UIImage 旋转至给定角度
    ///
    /// - Parameter angle: 旋转角度
    /// - Returns: 返回将指定 UIImage 旋转至给定角度后创建的可选副本
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
    
    /// 将指定 UIImage 旋转至给定角度(以弧度为旋转角度单位)
    ///
    /// - Parameter radians: 旋转角度(弧度为单位)
    /// - Returns: 返回将指定 UIImage 旋转至给定角度后创建的可选副本
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
    
    /// 将指定 UIImage 填充给定 UIColor
    ///
    /// - Parameter color: 填充颜色
    /// - Returns: 返回填充颜色后的 UIImage
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
    
    /// UIImage tinted with color
    ///
    /// - Parameters:
    ///   - color: color to tint image with.
    ///   - blendMode: how to blend the tint
    /// - Returns: UIImage tinted with given color.
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
    
    /// 将指定 UIImage 切割圆角
    ///
    /// - Parameter radius: 圆角半径，默认值为 nil
    /// - Returns: 返回切割圆角后的可选 UIImage
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
