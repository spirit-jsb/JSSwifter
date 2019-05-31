//
//  Int+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Int {
    
    // MARK:
    
    /// UInt
    ///
    ///     // Int(10).uInt, UInt(10)
    ///
    var uInt: UInt {
        return UInt(self)
    }
    
    /// Float
    ///
    ///     // (-1).float, Float(-1)
    ///     // 2.float, Float(2))
    ///
    var float: Float {
        return Float(self)
    }
    
    /// Double
    ///
    ///     // (-1).double, Double(-1)
    ///     // 2.double, Double(2))
    ///
    var double: Double {
        return Double(self)
    }
    
    /// CGFloat
    ///
    ///     // 1.cgFloat, CGFloat(1)
    ///
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    // MARK:
    
    /// 检查指定 Int 是否为素数
    ///
    ///     // 1999.isPrime(), true
    ///     // 4.isPrime(), false
    ///     // (-1).isPrime(), false
    ///
    /// - Warning: 检查超大数字时性能低下
    ///
    func isPrime() -> Bool {
        if self == 2 { return true }
        guard self > 1 && self % 2 != 0 else { return false }
        let base = Int(sqrt(Double(self)))
        for int in Swift.stride(from: 3, through: base, by: 2) where self % int == 0 {
            return false
        }
        return true
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

/// 幂
///
///     // 5 ** 2, Double(25)
///
/// - Parameters:
///   - lhs: 底数
///   - rhs: 指数
/// - Returns: 求幂结果，例如：2 ** 3 = 8
func ** (lhs: Int, rhs: Int) -> Double {
    return pow(Double(lhs), Double(rhs))
}

prefix operator √

/// 平方根
///
///     // √25, Double(5.0)
///
/// - Parameter int: 开方数
/// - Returns: 开方结果，例如 √25 = 5.0
public prefix func √ (int: Int) -> Double {
    return sqrt(Double(int))
}

infix operator ±

/// 加减运算
///
///     // (5 ± 2) == (3, 7), true
///
/// - Parameters:
///   - lhs:
///   - rhs:
/// - Returns: 加减运算结果，例如：2 ± 3 = (5, -1)
func ± (lhs: Int, rhs: Int) -> (Int, Int) {
    return (lhs + rhs, lhs - rhs)
}

prefix operator ±

/// 加减运算
///
///     // (±2) == (2, -2), true
///
/// - Parameter int:
/// - Returns: 加减运算结果，例如：± 3 = (3, -3)
public prefix func ± (int: Int) -> (Int, Int) {
    return 0 ± int
}
