//
//  Bool+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Bool {
    
    // MARK:
    
    /// 返回指定 Bool 值所对应的数字
    ///
    ///     // true.int = 1
    ///     // false.int = 0
    ///
    var int: Int {
        return self ? 1 : 0
    }
    
    /// 返回指定 Bool 值所对应的字符串
    ///
    ///     // true.string = "true"
    ///     // false.string, "false"
    ///
    var string: String {
        return self ? "true" : "false"
    }
}
