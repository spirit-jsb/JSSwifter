//
//  UIScrollView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    // MARK:
    
    /// 快照图像
    var snapshot: UIImage? {
        // Original Source: https://gist.github.com/thestoics/1204051
        UIGraphicsBeginImageContextWithOptions(self.contentSize, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        let previousFrame = self.frame
        self.frame = CGRect(origin: self.frame.origin, size: self.contentSize)
        self.layer.render(in: context)
        self.frame = previousFrame
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    // MARK:
    
    /// 将 Content 滚动至顶部(有动画)
    func scrollToTop() {
        self.scrollToTop(true)
    }
    
    /// 将 Content 滚动至底部(有动画)
    func scrollToBottom() {
        self.scrollToBottom(true)
    }
    
    /// 将 Content 滚动至左侧(有动画)
    func scrollToLeft() {
        self.scrollToLeft(true)
    }
    
    /// 将 Content 滚动至右侧(有动画)
    func scrollToRight() {
        self.scrollToRight(true)
    }
    
    /// 将 Content 滚动至顶部
    ///
    /// - Parameter animated: 是否显示滚动动画
    func scrollToTop(_ animated: Bool) {
        var offset = self.contentOffset
        offset.y = 0.0 - self.contentInset.top
        self.setContentOffset(offset, animated: animated)
    }
    
    /// 将 Content 滚动至底部
    ///
    /// - Parameter animated: 是否显示滚动动画
    func scrollToBottom(_ animated: Bool) {
        var offset = self.contentOffset
        offset.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom
        self.setContentOffset(offset, animated: animated)
    }
    
    /// 将 Content 滚动至左侧
    ///
    /// - Parameter animated: 是否显示滚动动画
    func scrollToLeft(_ animated: Bool) {
        var offset = self.contentOffset
        offset.x = 0.0 - self.contentInset.left
        self.setContentOffset(offset, animated: animated)
    }
    
    /// 将 Content 滚动至右侧
    ///
    /// - Parameter animated: 是否显示滚动动画
    func scrollToRight(_ animated: Bool) {
        var offset = self.contentOffset
        offset.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right
        self.setContentOffset(offset, animated: animated)
    }
}
