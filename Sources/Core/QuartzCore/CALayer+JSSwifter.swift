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
    var left: CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }
    
    var top: CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }
    
    var right: CGFloat {
        set {
            self.frame.origin.x = newValue - self.frame.size.width
        }
        get {
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    var bottom: CGFloat {
        set {
            self.frame.origin.y = newValue - self.frame.size.height
        }
        get {
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    var width: CGFloat {
        set {
            self.frame.size.width = newValue
        }
        get {
            return self.frame.size.width
        }
    }
    
    var height: CGFloat {
        set {
            self.frame.size.height = newValue
        }
        get {
            return self.frame.size.height
        }
    }
    
    var centerX: CGFloat {
        set {
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
        get {
            return self.frame.origin.x + self.frame.size.width * 0.5
        }
    }
    
    var centerY: CGFloat {
        set {
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
        get {
            return self.frame.origin.y + self.frame.size.height * 0.5
        }
    }
    
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
    
    var origin: CGPoint {
        set {
            self.frame.origin = newValue
        }
        get {
            return self.frame.origin
        }
    }
    
    var size: CGSize {
        set {
            self.frame.size = newValue
        }
        get {
            return self.frame.size
        }
    }
    
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
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.mask = shape
    }

    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3.0, offset: CGSize = .zero, opacity: Float = 0.5) {
        self.shadowColor = color.cgColor
        self.shadowRadius = radius
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.masksToBounds = false
    }

    func addSublayers(_ sublayers: [CALayer]) {
        sublayers.forEach { self.addSublayer($0) }
    }

    func removeSublayers() {
        self.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
