//
//  UIButton+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIButton {
    
    enum TitleImageAlignment {
        case left       // 文字在左，图像在右
        case top        // 文字在上，图像在下
        case right      // 文字在右，图像在左
        case bottom     // 文字在下，图像在上
    }
    
    // MARK:
    
    /// UIButton 为正常状态时的图像，可以从 Storyboard 中设置
    @IBInspectable var normalImage: UIImage? {
        set {
            self.setImage(newValue, for: .normal)
        }
        get {
            return self.image(for: .normal)
        }
    }
    
    /// UIButton 为高亮状态时的图像，可以从 Storyboard 中设置
    @IBInspectable var highlightedImage: UIImage? {
        set {
            self.setImage(newValue, for: .highlighted)
        }
        get {
            return self.image(for: .highlighted)
        }
    }
    
    /// UIButton 为选中状态时的图像，可以从 Storyboard 中设置
    @IBInspectable var selectedImage: UIImage? {
        set {
            self.setImage(newValue, for: .selected)
        }
        get {
            return self.image(for: .selected)
        }
    }
    
    /// UIButton 为禁用状态时的图像，可以从 Storyboard 中设置
    @IBInspectable var disabledImage: UIImage? {
        set {
            self.setImage(newValue, for: .disabled)
        }
        get {
            return self.image(for: .disabled)
        }
    }
    
    /// UIButton 为正常状态时的背景图像，可以从 Storyboard 中设置
    @IBInspectable var normalBackgroundImage: UIImage? {
        set {
            self.setBackgroundImage(newValue, for: .normal)
        }
        get {
            return self.backgroundImage(for: .normal)
        }
    }
    
    /// UIButton 为高亮状态时的背景图像，可以从 Storyboard 中设置
    @IBInspectable var highlightedBackgroundImage: UIImage? {
        set {
            self.setBackgroundImage(newValue, for: .highlighted)
        }
        get {
            return self.backgroundImage(for: .highlighted)
        }
    }
    
    /// UIButton 为选中状态时的背景图像，可以从 Storyboard 中设置
    @IBInspectable var selectedBackgroundImage: UIImage? {
        set {
            self.setBackgroundImage(newValue, for: .selected)
        }
        get {
            return self.backgroundImage(for: .selected)
        }
    }
    
    /// UIButton 为禁用状态时的背景图像，可以从 Storyboard 中设置
    @IBInspectable var disabledBackgroundImage: UIImage? {
        set {
            self.setBackgroundImage(newValue, for: .disabled)
        }
        get {
            return self.backgroundImage(for: .disabled)
        }
    }
    
    /// UIButton 为正常状态时的标题，可以从 Storyboard 中设置
    @IBInspectable var normalTitle: String? {
        set {
            self.setTitle(newValue, for: .normal)
        }
        get {
            return self.title(for: .normal)
        }
    }
    
    /// UIButton 为高亮状态时的标题，可以从 Storyboard 中设置
    @IBInspectable var highlightedTitle: String? {
        set {
            self.setTitle(newValue, for: .highlighted)
        }
        get {
            return self.title(for: .highlighted)
        }
    }
    
    /// UIButton 为选中状态时的标题，可以从 Storyboard 中设置
    @IBInspectable var selectedTitle: String? {
        set {
            self.setTitle(newValue, for: .selected)
        }
        get {
            return self.title(for: .selected)
        }
    }
    
    /// UIButton 为禁用状态时的标题，可以从 Storyboard 中设置
    @IBInspectable var disabledTitle: String? {
        set {
            self.setTitle(newValue, for: .disabled)
        }
        get {
            return self.title(for: .disabled)
        }
    }
    
    /// UIButton 为正常状态时的标题颜色，可以从 Storyboard 中设置
    @IBInspectable var normalTitleColor: UIColor? {
        set {
            self.setTitleColor(newValue, for: .normal)
        }
        get {
            return self.titleColor(for: .normal)
        }
    }
    
    /// UIButton 为高亮状态时的标题颜色，可以从 Storyboard 中设置
    @IBInspectable var highlightedTitleColor: UIColor? {
        set {
            self.setTitleColor(newValue, for: .highlighted)
        }
        get {
            return self.titleColor(for: .highlighted)
        }
    }
    
    /// UIButton 为选中状态时的标题颜色，可以从 Storyboard 中设置
    @IBInspectable var selectedTitleColor: UIColor? {
        set {
            self.setTitleColor(newValue, for: .selected)
        }
        get {
            return self.titleColor(for: .selected)
        }
    }
    
    /// UIButton 为禁用状态时的标题颜色，可以从 Storyboard 中设置
    @IBInspectable var disabledTitleColor: UIColor? {
        set {
            self.setTitleColor(newValue, for: .disabled)
        }
        get {
            return self.titleColor(for: .disabled)
        }
    }
    
    // MARK:
    
    /// 设置指定状态的图像
    ///
    /// - Parameters:
    ///   - image: 图像
    ///   - states: 状态数组，默认为所有状态
    func setImage(_ image: UIImage?, for states: [UIControl.State] = [.normal, .selected, .highlighted, .disabled]) {
        states.forEach { self.setImage(image, for: $0) }
    }
    
    /// 设置指定状态的背景图像
    ///
    /// - Parameters:
    ///   - backgroundImage: 背景图像
    ///   - states: 状态数组，默认为所有状态
    func setBackgroundImage(_ backgroundImage: UIImage?, for states: [UIControl.State] = [.normal, .selected, .highlighted, .disabled]) {
        states.forEach { self.setBackgroundImage(backgroundImage, for: $0) }
    }
    
    /// 设置指定状态的标题
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - states: 状态数组，默认为所有状态
    func setTitle(_ title: String?, for states: [UIControl.State] = [.normal, .selected, .highlighted, .disabled]) {
        states.forEach { self.setTitle(title, for: $0) }
    }
    
    /// 设置指定状态的标题颜色
    ///
    /// - Parameters:
    ///   - titleColor: 标题颜色
    ///   - states: 状态数组，默认为所有状态
    func setTitleColor(_ titleColor: UIColor?, for states: [UIControl.State] = [.normal, .selected, .highlighted, .disabled]) {
        states.forEach { self.setTitleColor(titleColor, for: $0) }
    }
    
    /// 调整标题与图像布局
    ///
    /// - Parameters:
    ///   - alignment: 标题与图像对齐方式，默认值为 .left
    ///   - spacing: 标题与图像间间距
    func layoutTitleAndImage(alignment: TitleImageAlignment = .left, spacing: CGFloat = 0.0) {
        let titleSize = self.titleLabel?.intrinsicContentSize ?? .zero
        let imageSize = self.imageView?.bounds.size ?? .zero
        
        let titleWidth = titleSize.width
        let imageWidth = imageSize.width
        
        let halfSpacing = spacing / 2.0
        let halfTitleWidth = titleSize.width / 2.0
        let halfTitleHeight = titleSize.height / 2.0
        let halfImageWidth = imageSize.width / 2.0
        let halfImageHeight = imageSize.height / 2.0
        
        var imageEdgeInsets: UIEdgeInsets = .zero
        var titleEdgeInsets: UIEdgeInsets = .zero
        switch alignment {
        case .left:
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -(imageWidth + halfSpacing), bottom: 0.0, right: (imageWidth + halfSpacing))
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: (titleWidth + halfSpacing), bottom: 0.0, right: -(titleWidth + halfSpacing))
        case .top:
            titleEdgeInsets = UIEdgeInsets(top: -(halfImageHeight + halfSpacing), left: -(halfImageWidth), bottom: (halfImageHeight + halfSpacing), right: (halfImageWidth))
            imageEdgeInsets = UIEdgeInsets(top: (halfTitleHeight + halfSpacing), left: (halfTitleWidth), bottom: -(halfTitleHeight + halfSpacing), right: -(halfTitleWidth))
        case .right:
            titleEdgeInsets = UIEdgeInsets(top: 0.0, left: (halfSpacing), bottom: 0.0, right: -(halfSpacing))
            imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -(halfSpacing), bottom: 0.0, right: (halfSpacing))
        case .bottom:
            titleEdgeInsets = UIEdgeInsets(top: (halfImageHeight + halfSpacing), left: -(halfImageWidth), bottom: -(halfImageHeight + halfSpacing), right: (halfImageWidth))
            imageEdgeInsets = UIEdgeInsets(top: -(halfTitleHeight + halfSpacing), left: (halfTitleWidth), bottom: (halfTitleHeight + halfSpacing), right: -(halfTitleWidth))
        }
        self.imageEdgeInsets = imageEdgeInsets
        self.titleEdgeInsets = titleEdgeInsets
    }
}
