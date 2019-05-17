//
//  CGSize+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import CoreGraphics

public extension CGSize {
    
    // MARK:
    var aspectRatio: CGFloat {
        return self.height == 0.0 ? 0.0 : self.width / self.height
    }
    
    var maxDimension: CGFloat {
        return max(self.width, self.height)
    }
    
    var minDimension: CGFloat {
        return min(self.width, self.height)
    }
    
    // MARK:
    func aspectFit(to boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / self.width, boundingSize.height / self.height)
        return CGSize(width: self.width * minRatio, height: self.height * minRatio)
    }
    
    func aspectFill(to boundingSize: CGSize) -> CGSize {
        let maxRatio = max(boundingSize.width / self.width, boundingSize.height / self.height)
        let aWidth = min(boundingSize.width, self.width * maxRatio)
        let aHeight = min(boundingSize.height, self.height * maxRatio)
        return CGSize(width: aWidth, height: aHeight)
    }
    
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs + rhs
    }
    
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs - rhs
    }
    
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }
    
    static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs * rhs
    }
    
    static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
    
    static func * (scalar: CGFloat, size: CGSize) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
    
    static func *= (size: inout CGSize, scalar: CGFloat) {
        size = size * scalar
    }
}
