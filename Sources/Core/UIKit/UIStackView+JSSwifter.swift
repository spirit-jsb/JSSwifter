//
//  UIStackView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    // MARK:
    
    /// 使用 UIView 数组和公共参数初始化 UIStackView
    ///
    /// - Parameters:
    ///   - arrangedSubviews: 添加至 UIStackView 上的 UIView 数组
    ///   - axis: 视图排列方向(水平 || 垂直)
    ///   - spacing: 排列子视图的边缘间距
    ///   - alignment: 排列子视图的垂直方向对齐方法
    ///   - distribution: 排列子视图的水平方向分布方法
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0.0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill)
    {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    // MARK:
    
    /// 将子视图数组添加至 arrangedSubviews 中
    ///
    /// - Parameter subviews: 子视图数组
    func addArrangedSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
    }
    
    /// 移除 UIStackView 上排列的所有的子视图
    func removeArrangedSubviews() {
        for subview in self.arrangedSubviews {
            self.removeArrangedSubview(subview)
        }
    }
}
