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
    var int: Int {
        return self ? 1 : 0
    }
    
    var string: String {
        return self ? "true" : "false"
    }
}
