//
//  CGColor+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import CoreGraphics

public extension CGColor {
    
    // MARK:
    var uiColor: UIColor? {
        return UIColor(cgColor: self)
    }
}
