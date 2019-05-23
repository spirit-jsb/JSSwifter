//
//  Comparable+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Comparable {
    
    // MARK:
    func isBetween(_ range: ClosedRange<Self>) -> Bool {
        return range ~= self
    }
    
    func clamped(to range: ClosedRange<Self>) -> Self {
        return max(range.lowerBound, min(self, range.upperBound))
    }
}
