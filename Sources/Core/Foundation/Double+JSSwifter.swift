//
//  Double+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Double {
    
    // MARK:
    
    /// Int
    ///
    ///     // Double(-1.0).int, -1
    ///     // Double(2.0).int, 2
    ///     // Double(4.3).int, 4
    ///
    var int: Int {
        return Int(self)
    }
    
    /// Float
    ///
    ///     // Double(-1.0).float, Float(-1.0)
    ///     // Double(2.0).float, Float(2.0)
    ///     // Double(4.3).float, Float(4.3)
    ///
    var float: Float {
        return Float(self)
    }
    
    /// CGFloat
    ///
    ///     // Double(4.3).cgFloat, CGFloat(4.3)
    ///
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

/// 幂
///
///     // (Double(5.0) ** Double(2.0)), Double(25.0)
///
/// - Parameters:
///   - lhs: 底数
///   - rhs: 指数
/// - Returns: 求幂结果，例如：2.0 ** 3.0 = 8.0
func ** (lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

prefix operator √

/// 平方根
///
///     // (√Double(25.0)), Double(5.0)
///
/// - Parameter double: 开方数
/// - Returns: 开方结果，例如 √25.0 = 5.0
public prefix func √ (double: Double) -> Double {
    return sqrt(double)
}
