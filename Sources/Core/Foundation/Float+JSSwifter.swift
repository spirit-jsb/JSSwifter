//
//  Float+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Float {
    
    // MARK:
    
    /// Int
    ///
    ///     // Float(-1.0).int, -1
    ///     // Float(2.0).int, 2
    ///     // Float(4.3).int, 4
    ///
    var int: Int {
        return Int(self)
    }
    
    /// Double
    ///
    ///     // Float(-1.0).double, Double(-1.0)
    ///     // Float(2.0).double, Double(2.0)
    ///     // Float(4.3).double, Double(4.3)
    ///
    var double: Double {
        return Double(self)
    }
    
    /// CGFloat
    ///
    ///     // Float(4.3).cgFloat, CGFloat(4.3)
    ///
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

/// 幂
///
///     // (Float(5.0) ** Float(2.0)), Float(25.0)
///
/// - Parameters:
///   - lhs: 底数
///   - rhs: 指数
/// - Returns: 求幂结果，例如：2.0 ** 3.0 = 8.0
func ** (lhs: Float, rhs: Float) -> Float {
    return pow(lhs, rhs)
}

prefix operator √

/// 平方根
///
///     // (√Float(25.0)), Float(5.0)
///
/// - Parameter float: 开方数
/// - Returns: 开方结果，例如 √25.0 = 5.0
public prefix func √ (float: Float) -> Float {
    return sqrt(float)
}
