//
//  Locale+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Locale {
    
    // MARK
    
    /// 当前语言环境中的 UNIX，通常用于标准化
    static var posix: Locale {
        return Locale(identifier: "en_US_POSIX")
    }
}
