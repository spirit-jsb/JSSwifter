//
//  StringProtocol+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/25.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension StringProtocol {
    
    // MARK:
    func commonSuffix<T: StringProtocol>(with aString: T, options: String.CompareOptions = []) -> String {
        guard !self.isEmpty && !aString.isEmpty else { return "" }
        
        var idx = self.endIndex
        var strIdx = aString.endIndex
        
        repeat {
            self.formIndex(before: &idx)
            aString.formIndex(before: &strIdx)
            
            guard String(self[idx]).compare(String(aString[strIdx]), options: options) == .orderedSame else {
                self.formIndex(after: &idx)
                break
            }
        } while idx > self.startIndex && strIdx > aString.startIndex
        
        return String(self[idx...])
    }
}
