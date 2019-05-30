//
//  UIView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIView {
    
    enum AngleUnit {
        case degrees
        case radians
    }
    
    enum ShakeDirection {
        case horizontal
        case vertical
    }
    
    enum ShakeAnimationType {
        case linear
        case easeIn
        case easeOut
        case easeInOut
    }
    
    // MARK:
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let color = newValue else {
                self.layer.borderColor = nil
                return
            }
            self.layer.borderColor = color.cgColor
        }
        get {
            guard let color = self.layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = abs(CGFloat(Int(newValue * 100.0)) / 100)
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
        get {
            guard let color = self.layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        set {
            self.layer.shadowOffset = newValue
        }
        get {
            return self.layer.shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        set {
            self.layer.shadowOpacity = newValue
        }
        get {
            return self.layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        set {
            self.layer.shadowRadius = newValue
        }
        get {
            return self.layer.shadowRadius
        }
    }
    
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
            self.center.x = newValue
        }
        get {
            return self.center.x
        }
    }
    
    var centerY: CGFloat {
        set {
            self.center.y = newValue
        }
        get {
            return self.center.y
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
    
    var snapshotImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    var parentViewController: UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    // MARK:
    func firstResponder() -> UIView? {
        var views = [UIView](arrayLiteral: self)
        var index = 0
        repeat {
            let view = views[index]
            if view.isFirstResponder {
                return view
            }
            views.append(contentsOf: view.subviews)
            index += 1
        } while index < views.count
        return nil
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
    
    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3.0, offset: CGSize = .zero, opacity: Float = 0.5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { self.addSubview($0) }
    }
    
    func removeSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { self.addGestureRecognizer($0) }
    }
    
    func removeGestureRecognizers() {
        self.gestureRecognizers?.forEach { self.removeGestureRecognizer($0) }
    }
    
    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { self.removeGestureRecognizer($0) }
    }
    
    func fadeIn(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        if self.isHidden {
            self.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        if self.isHidden {
            self.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func rotate(byAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil)
    {
        let angleWithType: CGFloat = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration: TimeInterval = animated ? duration : 0.0
        UIView.animate(withDuration: aDuration, delay: 0.0, options: .curveLinear, animations: {
            self.transform = self.transform.rotated(by: angleWithType)
        }, completion: completion)
    }
    
    func rotate(toAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil)
    {
        let angleWithType: CGFloat = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration: TimeInterval = animated ? duration : 0.0
        UIView.animate(withDuration: aDuration, delay: 0.0, options: .curveLinear, animations: {
            self.transform = self.transform.concatenating(CGAffineTransform(rotationAngle: angleWithType))
        }, completion: completion)
    }
    
    func scale(by offset: CGPoint, animated: Bool = false, duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
                self.transform = self.transform.scaledBy(x: offset.x, y: offset.y)
            }, completion: completion)
        }
        else {
            self.transform = self.transform.scaledBy(x: offset.x, y: offset.y)
            completion?(true)
        }
    }
    
    func shake(direction: ShakeDirection = .horizontal, animationType: ShakeAnimationType = .easeOut, dureation: TimeInterval = 1.0, completion: (() -> Void)? = nil)
    {
        CATransaction.begin()
        let animation: CAKeyframeAnimation
        switch direction {
        case .horizontal:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        case .vertical:
            animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        }
        switch animationType {
        case .linear:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        case .easeIn:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        case .easeOut:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        case .easeInOut:
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        }
        CATransaction.setCompletionBlock(completion)
        animation.duration = dureation
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        self.layer.add(animation, forKey: "shake")
        CATransaction.commit()
    }
    
    func convert(_ point: CGPoint, toViewOrWindow view: UIView?) -> CGPoint {
        guard let _view = view else {
            return (self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self).convert(point, to: nil)
        }
        
        let from: UIWindow? = self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self.window
        let to: UIWindow? = _view.isKind(of: UIWindow.self) ? (_view as! UIWindow) : _view.window
        
        guard let _from = from, let _to = to, _from != _to else {
            return self.convert(point, to: _view)
        }
        
        var _point: CGPoint = point
        
        _point = self.convert(point, to: _from)
        _point = _to.convert(point, from: _from)
        _point = _view.convert(point, from: _to)
        
        return _point
    }
    
    func convert(_ point: CGPoint, fromViewOrWindow view: UIView?) -> CGPoint {
        guard let _view = view else {
            return (self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self).convert(point, from: nil)
        }
        
        let from: UIWindow? = _view.isKind(of: UIWindow.self) ? (_view as! UIWindow) : _view.window
        let to: UIWindow? = self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self.window
        
        guard let _from = from, let _to = to, _from != _to else {
            return self.convert(point, from: _view)
        }
        
        var _point: CGPoint = point
        
        _point = _from.convert(point, from: _view)
        _point = _to.convert(point, from: _from)
        _point = self.convert(point, from: _to)
        
        return _point
    }
    
    func convert(_ rect: CGRect, toViewOrWindow view: UIView?) -> CGRect {
        guard let _view = view else {
            return (self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self).convert(rect, to: nil)
        }
        
        let from: UIWindow? = self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self.window
        let to: UIWindow? = _view.isKind(of: UIWindow.self) ? (_view as! UIWindow) : _view.window
        
        guard let _from = from, let _to = to, _from != _to else {
            return self.convert(rect, to: _view)
        }
        
        var _rect: CGRect = rect
        
        _rect = self.convert(rect, to: _from)
        _rect = _to.convert(rect, from: _from)
        _rect = _view.convert(rect, from: _to)
        
        return _rect
    }
    
    func convert(_ rect: CGRect, fromViewOrWindow view: UIView?) -> CGRect {
        guard let _view = view else {
            return (self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self).convert(rect, from: nil)
        }
        
        let from: UIWindow? = _view.isKind(of: UIWindow.self) ? (_view as! UIWindow) : _view.window
        let to: UIWindow? = self.isKind(of: UIWindow.self) ? (self as! UIWindow) : self.window
        
        guard let _from = from, let _to = to, _from != _to else {
            return self.convert(rect, from: _view)
        }
        
        var _rect: CGRect = rect
        
        _rect = _from.convert(rect, from: _view)
        _rect = _to.convert(rect, from: _from)
        _rect = self.convert(rect, from: _to)
        
        return _rect
    }
}
