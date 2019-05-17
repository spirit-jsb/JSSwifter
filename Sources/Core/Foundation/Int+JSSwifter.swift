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
    var uInt: UInt {
        return UInt(self)
    }
    
    var float: Float {
        return Float(self)
    }
    
    var double: Double {
        return Double(self)
    }
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    // MARK:
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

func ** (lhs: Int, rhs: Int) -> Double {
    return pow(Double(lhs), Double(rhs))
}

prefix operator √

public prefix func √ (int: Int) -> Double {
    return sqrt(Double(int))
}

infix operator ±

func ± (lhs: Int, rhs: Int) -> (Int, Int) {
    return (lhs + rhs, lhs - rhs)
}

prefix operator ±

public prefix func ± (int: Int) -> (Int, Int) {
    return 0 ± int
}
