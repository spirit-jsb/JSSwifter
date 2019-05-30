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
    
    /// 返回纵横比例
    var aspectRatio: CGFloat {
        return self.height == 0.0 ? 0.0 : self.width / self.height
    }
    
    /// 返回最大宽度或高度
    var maxDimension: CGFloat {
        return max(self.width, self.height)
    }
    
    /// 返回最小宽度或高度
    var minDimension: CGFloat {
        return min(self.width, self.height)
    }
    
    // MARK:
    
    /// 自适应调整指定 CGSize 至给定的边界范围
    ///
    ///     let rect = CGSize(width: 120, height: 80)
    ///     let parentRect  = CGSize(width: 100, height: 50)
    ///     let newRect = rect.aspectFit(to: parentRect)
    ///     //newRect.width = 75 , newRect = 50
    ///
    /// - Parameter boundingSize: 边界范围
    /// - Returns: 返回自适应调整至给定的边界范围后的 CGSize
    func aspectFit(to boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / self.width, boundingSize.height / self.height)
        return CGSize(width: self.width * minRatio, height: self.height * minRatio)
    }
    
    /// 填充调整指定 CGSize 至给定的边界范围
    ///
    ///     let rect = CGSize(width: 20, height: 120)
    ///     let parentRect  = CGSize(width: 100, height: 60)
    ///     let newRect = rect.aspectFit(to: parentRect)
    ///     //newRect.width = 100 , newRect = 60
    ///
    /// - Parameter boundingSize: 边界范围
    /// - Returns: 返回填充调整至给定的边界范围后的 CGSize
    func aspectFill(to boundingSize: CGSize) -> CGSize {
        let maxRatio = max(boundingSize.width / self.width, boundingSize.height / self.height)
        let aWidth = min(boundingSize.width, self.width * maxRatio)
        let aHeight = min(boundingSize.height, self.height * maxRatio)
        return CGSize(width: aWidth, height: aHeight)
    }
    
    /// 两给定 CGSize 相加
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA + sizeB
    ///     //result = CGSize(width: 8, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGSize
    ///   - rhs: 右侧给定 CGSize
    /// - Returns: 返回两给定 CGSize 相加结果
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    /// 指定 CGSize 与给定 CGSize 相加
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA += sizeB
    ///     //sizeA = CGSize(width: 8, height: 14)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs + rhs
    }
    
    /// 两给定 CGSize 相减
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA - sizeB
    ///     //result = CGSize(width: 2, height: 6)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGSize
    ///   - rhs: 右侧给定 CGSize
    /// - Returns: 返回两给定 CGSize 相减结果
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    /// 指定 CGSize 与给定 CGSize 相减
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA -= sizeB
    ///     //sizeA = CGSize(width: 2, height: 6)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs - rhs
    }
    
    /// 两给定 CGSize 相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     let result = sizeA * sizeB
    ///     //result = CGSize(width: 15, height: 40)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGSize
    ///   - rhs: 右侧给定 CGSize
    /// - Returns: 返回两给定 CGSize 相乘结果
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
    }
    
    /// 指定 CGSize 与给定 CGSize 相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let sizeB = CGSize(width: 3, height: 4)
    ///     sizeA *= sizeB
    ///     //sizeA = CGSize(width: 15, height: 40)
    ///
    /// - Parameters:
    ///   - lhs: 左侧指定 CGPoint
    ///   - rhs: 右侧给定 CGPoint
    static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs * rhs
    }
    
    /// 指定 CGSize 与给定标量相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = sizeA * 5
    ///     //result = CGSize(width: 25, height: 50)
    ///
    /// - Parameters:
    ///   - size: 指定 CGSize
    ///   - scalar: 给定标量
    /// - Returns: 返回指定 CGSize 与给定标量相乘结果
    static func * (size: CGSize, scalar: CGFloat) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
    
    /// 指定标量与给定 CGSize 相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     let result = 5 * sizeA
    ///     //result = CGSize(width: 25, height: 50)
    ///
    /// - Parameters:
    ///   - scalar: 给定标量
    ///   - size: 指定 CGSize
    /// - Returns: 返回指定标量与给定 CGSize 相乘结果
    static func * (scalar: CGFloat, size: CGSize) -> CGSize {
        return CGSize(width: size.width * scalar, height: size.height * scalar)
    }
    
    /// 指定 CGSize 与给定标量相乘
    ///
    ///     let sizeA = CGSize(width: 5, height: 10)
    ///     sizeA *= 3
    ///     //result = CGSize(width: 15, height: 30)
    ///
    /// - Parameters:
    ///   - point: 指定 CGSize
    ///   - scalar: 给定标量
    static func *= (size: inout CGSize, scalar: CGFloat) {
        size = size * scalar
    }
}
