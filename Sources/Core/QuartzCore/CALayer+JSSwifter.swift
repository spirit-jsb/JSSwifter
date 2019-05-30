//
//  CALayer+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/28.
//  Copyright © 2019 Max. All rights reserved.
//

import QuartzCore

public extension CALayer {
    
    // MAKR:
    
    /// frame.origin.x 的快捷方法
    var left: CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }
    
    /// frame.origin.y 的快捷方法
    var top: CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
    
    /// frame.origin.x + frame.size.width 的快捷方法
    var right: CGFloat {
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
        get {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    /// frame.origin.y + frame.size.height 的快捷方法
    var bottom: CGFloat {
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    /// frame.size.width 的快捷方法
    var width: CGFloat {
        set {
            self.frame.size.width = newValue
        }
        get {
            return self.frame.size.width
        }
    }
    
    /// frame.size.height 的快捷方法
    var height: CGFloat {
        set {
            self.frame.size.height = newValue
        }
        get {
            return self.frame.size.height
        }
    }
    
    /// center.x 的快捷方法
    var centerX: CGFloat {
        set {
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
        get {
            return self.frame.origin.x + self.frame.size.width * 0.5
        }
    }
    
    /// center.y 的快捷方法
    var centerY: CGFloat {
        set {
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
        get {
            return self.frame.origin.y + self.frame.size.height * 0.5
        }
    }
    
    /// center 的快捷方法
    var center: CGPoint {
        set {
            self.frame.origin.x = newValue.x - self.frame.size.width * 0.5
            self.frame.origin.y = newValue.y - self.frame.size.height * 0.5
        }
        get {
            return CGPoint(x: self.frame.origin.x + self.frame.size.width * 0.5,
                           y: self.frame.origin.y + self.frame.size.height * 0.5)
        }
    }
    
    /// frame.origin 的快捷方法
    var origin: CGPoint {
        set {
            self.frame.origin = newValue
        }
        get {
            return self.frame.origin
        }
    }
    
    /// frame.size 的快捷方法
    var size: CGSize {
        set {
            self.frame.size = newValue
        }
        get {
            return self.frame.size
        }
    }
    
    /// contentsGravity 属性的包装属性
    var contentMode: UIView.ContentMode {
        set {
            switch newValue {
            case .center:
                self.contentsGravity = .center
            case .top:
                self.contentsGravity = .top
            case .bottom:
                self.contentsGravity = .bottom
            case .left:
                self.contentsGravity = .left
            case .right:
                self.contentsGravity = .right
            case .topLeft:
                self.contentsGravity = .topLeft
            case .topRight:
                self.contentsGravity = .topRight
            case .bottomLeft:
                self.contentsGravity = .bottomLeft
            case .bottomRight:
                self.contentsGravity = .bottomRight
            case .scaleToFill:
                self.contentsGravity = .resize
            case .scaleAspectFit:
                self.contentsGravity = .resizeAspect
            case .scaleAspectFill:
                self.contentsGravity = .resizeAspectFill
            default:
                self.contentsGravity = .resize
            }
        }
        get {
            var contentMode: UIView.ContentMode
            switch self.contentsGravity {
            case .center:
                contentMode = .center
            case .top:
                contentMode = .top
            case .bottom:
                contentMode = .bottom
            case .left:
                contentMode = .left
            case .right:
                contentMode = .right
            case .topLeft:
                contentMode = .topLeft
            case .topRight:
                contentMode = .topRight
            case .bottomLeft:
                contentMode = .bottomLeft
            case .bottomRight:
                contentMode = .bottomRight
            case .resize:
                contentMode = .scaleToFill
            case .resizeAspect:
                contentMode = .scaleAspectFit
            case .resizeAspectFill:
                contentMode = .scaleAspectFill
            default:
                contentMode = .scaleToFill
            }
            return contentMode
        }
    }
    
    /// 快照图像，图像尺寸与 CALayer 尺寸一致
    var snapshotImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    // MARK:
    
    /// 设置指定 CALayer 视图圆角
    ///
    /// - Parameters:
    ///   - corners: 需设置圆角的角数组，例如：[.topLeft, .topRight]
    ///   - radius: 圆角半径
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.mask = shape
    }

    /// 设置指定 CALayer 视图阴影
    ///
    /// - Parameters:
    ///   - color: 阴影颜色，默认值为 #137992
    ///   - radius: 阴影模糊半径，默认值为 3.0
    ///   - offset: 阴影偏移量，默认值为 .zero
    ///   - opacity: 阴影不透明度，默认值为 0.5
    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3.0, offset: CGSize = .zero, opacity: Float = 0.5) {
        self.shadowColor = color.cgColor
        self.shadowRadius = radius
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.masksToBounds = false
    }

    /// 向指定 CALayer 添加子 CALayer 数组
    ///
    /// - Parameter sublayers: 需要添加的子 CALayer 数组
    func addSublayers(_ sublayers: [CALayer]) {
        sublayers.forEach { self.addSublayer($0) }
    }

    /// 移除指定 CALayer 上的所有子 CALayer
    func removeSublayers() {
        self.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
