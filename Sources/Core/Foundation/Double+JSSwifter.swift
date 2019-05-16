//
//  Double+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation
import CoreGraphics
import Darwin

public extension Double {
    
    // MARK:
    var int: Int {
        return Int(self)
    }
    
    var float: Float {
        return Float(self)
    }
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

func ** (lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

prefix operator √

public prefix func √ (double: Double) -> Double {
    return sqrt(double)
}
