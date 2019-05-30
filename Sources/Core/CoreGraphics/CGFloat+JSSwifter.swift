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
    /// 返回指定 CGFloat 的绝对值
    var abs: CGFloat {
        return Swift.abs(self)
    }
    
    /// 返回大于或等于指定 CGFloat 的最小整数
    var ceil: CGFloat {
        return Foundation.ceil(self)
    }
    
    /// 返回小于或等于指定 CGFloat 的最大整数
    var floor: CGFloat {
        return Foundation.floor(self)
    }
    
    /// 返回指定角度所对应的弧度值
    var degreesToRadians: CGFloat {
        return .pi * self / 180.0
    }
    
    /// 返回指定弧度值所对应的角度
    var radiansToDegrees: CGFloat {
        return self * 180.0 / .pi
    }
    
    /// 检查指定 CGFloat 是否为正
    var isPositive: Bool {
        return self > 0.0
    }
    
    /// 检查指定 CGFloat 是否为负
    var isNegative: Bool {
        return self < 0.0
    }
    
    /// 返回指定 CGFloat 所对应的 Int
    var int: Int {
        return Int(self)
    }
    
    /// 返回指定 CGFloat 所对应的 Float
    var float: Float {
        return Float(self)
    }
    
    /// 返回指定 CGFloat 所对应的 Double
    var double: Double {
        return Double(self)
    }
}
