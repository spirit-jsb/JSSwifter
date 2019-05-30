//
//  UIView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// 角度单位
    ///
    /// - degrees: 度
    /// - radians: 弧度
    enum AngleUnit {
        case degrees
        case radians
    }
    
    /// 摇摆方向
    ///
    /// - horizontal: 左右摇动
    /// - vertical: 上下摇动
    enum ShakeDirection {
        case horizontal
        case vertical
    }
    
    /// 摇摆动画类型
    enum ShakeAnimationType {
        case linear
        case easeIn
        case easeOut
        case easeInOut
    }
    
    // MARK:
    
    /// 边框颜色，可以从 Storyboard 中设置
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
    
    /// 边框宽度，可以从 Storyboard 中设置
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    /// 圆角半径，可以从 Storyboard 中设置
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = abs(CGFloat(Int(newValue * 100.0)) / 100)
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    /// 阴影颜色，可以从 Storyboard 中设置
    @IBInspectable var shadowColor: UIColor? {
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
        get {
            guard let color = self.layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    /// 阴影偏移量，可以从 Storyboard 中设置
    @IBInspectable var shadowOffset: CGSize {
        set {
            self.layer.shadowOffset = newValue
        }
        get {
            return self.layer.shadowOffset
        }
    }
    
    /// 阴影不透明度，可以从 Storyboard 中设置
    @IBInspectable var shadowOpacity: Float {
        set {
            self.layer.shadowOpacity = newValue
        }
        get {
            return self.layer.shadowOpacity
        }
    }
    
    /// 阴影模糊半径，可以从 Storyboard 中设置
    @IBInspectable var shadowRadius: CGFloat {
        set {
            self.layer.shadowRadius = newValue
        }
        get {
            return self.layer.shadowRadius
        }
    }
    
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
            self.center.x = newValue
        }
        get {
            return self.center.x
        }
    }
    
    /// center.y 的快捷方法
    var centerY: CGFloat {
        set {
            self.center.y = newValue
        }
        get {
            return self.center.y
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
    
    /// 快照图像
    var snapshotImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.layer.frame.size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// 获取指定 UIView 的父视图控制器
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
    
    /// 递归寻找指定 UIView 的第一响应者
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
    
    /// 设置指定 UIView 视图圆角
    ///
    /// - Parameters:
    ///   - corners: 需设置圆角的角数组，例如：[.topLeft, .topRight]
    ///   - radius: 圆角半径
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
    
    /// 设置指定 UIView 视图阴影
    ///
    /// - Parameters:
    ///   - color: 阴影颜色，默认值为 #137992
    ///   - radius: 阴影模糊半径，默认值为 3.0
    ///   - offset: 阴影偏移量，默认值为 .zero
    ///   - opacity: 阴影不透明度，默认值为 0.5
    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3.0, offset: CGSize = .zero, opacity: Float = 0.5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
    }
    
    /// 向指定 UIView 添加子 UIView 数组
    ///
    /// - Parameter subviews: 需要添加的子 UIView 数组
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { self.addSubview($0) }
    }
    
    /// 移除指定 UIView 上的所有子 UIView
    func removeSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    /// 向指定 UIView 上添加子 GestureRecognizer 数组
    ///
    /// - Parameter gestureRecognizers: 需要添加的子 GestureRecognizer 数组
    func addGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { self.addGestureRecognizer($0) }
    }
    
    /// 移除指定 UIView 上的所有子 GestureRecognizer
    func removeGestureRecognizers() {
        self.gestureRecognizers?.forEach { self.removeGestureRecognizer($0) }
    }
    
    /// 从指定 UIView 上移除子 GestureRecognizer 数组
    ///
    /// - Parameter gestureRecognizers: 需要移除的子 GestureRecognizer 数组
    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { self.removeGestureRecognizer($0) }
    }
    
    /// 淡入动画
    ///
    /// - Parameters:
    ///   - duration: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
    func fadeIn(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        if self.isHidden {
            self.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    /// 淡出动画
    ///
    /// - Parameters:
    ///   - duration: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
    func fadeOut(duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil) {
        if self.isHidden {
            self.isHidden = false
        }
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    /// 旋转动画，将指定 UIView 旋转相应角度
    ///
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - type: 旋转角度单位
    ///   - animated: 是否展示旋转动画，默认值为 false
    ///   - duration: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
    func rotate(byAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil)
    {
        let angleWithType: CGFloat = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration: TimeInterval = animated ? duration : 0.0
        UIView.animate(withDuration: aDuration, delay: 0.0, options: .curveLinear, animations: {
            self.transform = self.transform.rotated(by: angleWithType)
        }, completion: completion)
    }
    
    /// 旋转动画，将指定 UIView 旋转至相应角度
    ///
    /// - Parameters:
    ///   - angle: 旋转角度
    ///   - type: 旋转角度单位
    ///   - animated: 是否展示旋转动画，默认值为 false
    ///   - duration: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
    func rotate(toAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1.0, completion: ((Bool) -> Void)? = nil)
    {
        let angleWithType: CGFloat = (type == .degrees) ? .pi * angle / 180.0 : angle
        let aDuration: TimeInterval = animated ? duration : 0.0
        UIView.animate(withDuration: aDuration, delay: 0.0, options: .curveLinear, animations: {
            self.transform = self.transform.concatenating(CGAffineTransform(rotationAngle: angleWithType))
        }, completion: completion)
    }
    
    /// 缩放动画
    ///
    /// - Parameters:
    ///   - offset: 缩放偏移量
    ///   - animated: 是否展示缩放动画，默认值为 false
    ///   - duration: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
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
    
    /// 摇摆动画
    ///
    /// - Parameters:
    ///   - direction: 摇摆方向，默认值为 .horizontal
    ///   - animationType: 摇摆动画类型，默认值为 .easeOut
    ///   - dureation: 动画持续时间，默认值为 1.0
    ///   - completion: 动画结束后可选的处理闭包，默认值为 nil
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
    
    /// 将给定 CGPoint 从指定 UIView 坐标系转换为给定 UIView 坐标系中相应的 CGPoint
    ///
    /// - Parameters:
    ///   - point: 指定 UIView 坐标系中的给定 CGPoint
    ///   - view: 给定 UIView，如果为 nil 时，会将坐标系设置为 UIWindow 坐标系
    /// - Returns: 转换坐标系后相应的 CGPoint
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
    
    /// 将给定 CGPoint 从给定 UIView 坐标系转换为指定 UIView 坐标系中相应的 CGPoint
    ///
    /// - Parameters:
    ///   - point: 给定 UIView 坐标系中的给定 CGPoint
    ///   - view: 指定 UIView，如果为 nil 时，会将坐标系设置为 UIWindow 坐标系
    /// - Returns: 转换坐标系后相应的 CGPoint
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
    
    /// 将给定 CGRect 从指定 UIView 坐标系转换为给定 UIView 坐标系中相应的 CGRect
    ///
    /// - Parameters:
    ///   - point: 指定 UIView 坐标系中的给定 CGRect
    ///   - view: 给定 UIView，如果为 nil 时，会将坐标系设置为 UIWindow 坐标系
    /// - Returns: 转换坐标系后相应的 CGRect
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
    
    /// 将给定 CGRect 从给定 UIView 坐标系转换为指定 UIView 坐标系中相应的 CGRect
    ///
    /// - Parameters:
    ///   - point: 给定 UIView 坐标系中的给定 CGRect
    ///   - view: 指定 UIView，如果为 nil 时，会将坐标系设置为 UIWindow 坐标系
    /// - Returns: 转换坐标系后相应的 CGRect
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
