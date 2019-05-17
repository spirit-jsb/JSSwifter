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
    var snapshot: UIImage? {
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
    func scrollToTop() {
        self.scrollToTop(true)
    }
    
    func scrollToBottom() {
        self.scrollToBottom(true)
    }
    
    func scrollToLeft() {
        self.scrollToLeft(true)
    }
    
    func scrollToRight() {
        self.scrollToRight(true)
    }
    
    func scrollToTop(_ animated: Bool) {
        var offset = self.contentOffset
        offset.y = 0.0 - self.contentInset.top
        self.setContentOffset(offset, animated: animated)
    }
    
    func scrollToBottom(_ animated: Bool) {
        var offset = self.contentOffset
        offset.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom
        self.setContentOffset(offset, animated: animated)
    }
    
    func scrollToLeft(_ animated: Bool) {
        var offset = self.contentOffset
        offset.x = 0.0 - self.contentInset.left
        self.setContentOffset(offset, animated: animated)
    }
    
    func scrollToRight(_ animated: Bool) {
        var offset = self.contentOffset
        offset.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right
        self.setContentOffset(offset, animated: animated)
    }
}
