//
//  CGFloat+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import CoreGraphics

public extension CGFloat {
    
    // MARK:
    var abs: CGFloat {
        return Swift.abs(self)
    }
    
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }
    
    var floor: CGFloat {
        return Foundation.floor(self)
    }
    
    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }
    
    var radiansToDegrees: CGFloat {
        return self * 180.0 / .pi
    }
    
    var isPositive: Bool {
        return self > 0.0
    }
    
    var isNegative: Bool {
        return self < 0.0
    }
    
    var int: Int {
        return Int(self)
    }
    
    var float: Float {
        return Float(self)
    }
    
    var double: Double {
        return Double(self)
    }
}
