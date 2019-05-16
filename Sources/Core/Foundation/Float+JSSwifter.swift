//
//  Float+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation
import CoreGraphics
import Darwin

public extension Float {
    
    // MARK:
    var int: Int {
        return Int(self)
    }
    
    var double: Double {
        return Double(self)
    }
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

func ** (lhs: Float, rhs: Float) -> Float {
    return pow(lhs, rhs)
}

prefix operator √

public prefix func √ (float: Float) -> Float {
    return sqrt(float)
}
