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
    
    /// 返回指定 StringProtocol 与给定 StringProtocol 后缀比较结果
    ///
    ///     let string1 = "Hello world!"
    ///     // "".commonSuffix(with: "It's cold!").isEmpty, true
    ///     // string1.commonSuffix(with: "").isEmpty, true
    ///     // string1.commonSuffix(with: "It's cold!"), "ld!"
    ///     // string1.commonSuffix(with: "Not Common"), ""
    ///
    /// - Parameters:
    ///   - aString: 给定 StringProtocol 实例
    ///   - options: 比较选项
    /// - Returns: 返回指定 StringProtocol 与给定 StringProtocol 后缀比较结果
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
