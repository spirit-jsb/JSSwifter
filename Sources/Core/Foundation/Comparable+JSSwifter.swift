//
//  Comparable+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Comparable {
    
    // MARK:
    
    /// 返回指定 Comparable 是否在给定 ClosedRange<Comparable> 范围内
    ///
    ///     1.isBetween(5...8) -> false
    ///     7.isBetween(3...8) -> true
    ///
    /// - Parameter range: 检查范围
    /// - Returns: 返回指定 Comparable 是否在给定 ClosedRange<Comparable> 返回内
    func isBetween(_ range: ClosedRange<Self>) -> Bool {
        return range ~= self
    }
    
    /// 返回指定 Comparable 在给定 ClosedRange<Comparable> 范围内最接近的值
    ///
    ///     1.clamped(to: 3...8) -> 3
    ///     4.clamped(to: 3...7) -> 4
    ///     0.32.clamped(to: 0.32...0.33) -> 0.32
    ///     "c".clamped(to: "e"..."g") -> "e"
    ///
    /// - Parameter range: 检查范围
    /// - Returns: 返回指定 Comparable 在给定 ClosedRange<Comparable> 范围内最接近的值
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }
}
