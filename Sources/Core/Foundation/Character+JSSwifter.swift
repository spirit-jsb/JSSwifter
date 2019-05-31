//
//  Character+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Character {
    
    // MARK:
    
    /// 检查指定 Character 是否为 Emoji
    ///
    ///     // Character("😢").isEmoji, true
    ///
    var isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case (0x1F600...0x1F64F), // Emoticons
             (0x1F300...0x1F5FF), // Misc Symbols and Pictographs
             (0x1F680...0x1F6FF), // Transport and Map
             (0x1F1E6...0x1F1FF), // Regional country flags
             (0x2600...0x26FF),   // Misc symbols
             (0x2700...0x27BF),   // Dingbats
             (0xE0020...0xE007F), // Tags
             (0xFE00...0xFE0F),   // Variation Selectors
             (0x1F900...0x1F9FF), // Supplemental Symbols and Pictographs
             (0x1F018...0x1F270), // Various asian characters
             (0x238C...0x2454),   // Misc items
             (0x20D0...0x20FF):
            return true
        default:
            return false
        }
    }
    
    /// 检查指定 Character 是否为数字
    ///
    ///     "1".isNumber -> true
    ///     "a".isNumber -> false
    ///
    var isNumber: Bool {
        return Int(String(self)) != nil
    }
    
    /// 检查指定 Character 是否为字母
    ///
    ///     "1".isLetter -> false
    ///     "a".isLetter -> true
    ///
    var isLetter: Bool {
        return String(self).rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    /// 检查指定 Character 是否为小写
    ///
    ///     "A".isLowercased -> false
    ///     "a".isLowercased -> true
    ///
    var isLowercased: Bool {
        return String(self) == String(self).lowercased()
    }
    
    /// 检查指定 Character 是否为大写
    ///
    ///     "A".isUppercased -> true
    ///     "a".isUppercased -> fasle
    ///
    var isUppercased: Bool {
        return String(self) == String(self).uppercased()
    }
    
    /// Optional Int
    ///
    ///     "1".int -> 1
    ///     "a".int -> nil
    ///
    var int: Int? {
        return Int(String(self))
    }
    
    /// Optional Float
    ///
    ///     "1".float -> Float(1)
    ///     "a".float -> nil
    ///
    var float: Float? {
        return Float(String(self))
    }
    
    /// Optional Double
    ///
    ///     "1".double -> Double(1)
    ///     "a".double -> nil
    ///
    var double: Double? {
        return Double(String(self))
    }
    
    /// String
    ///
    ///     Character("a").string -> "a"
    ///
    var string: String {
        return String(self)
    }
    
    /// 返回小写字符
    ///
    ///     Character("A").lowercased -> Character("a")
    ///
    var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    /// 返回大写字符
    ///
    ///     Character("a").lowercased -> Character("A")
    ///
    var uppercased: Character {
        return String(self).uppercased().first!
    }
    
    // MARK:
    
    /// 生成随机字符
    ///
    ///     Character.randomAlphanumeric() -> "a"
    ///
    /// - Returns: 返回随机字符
    static func randomAlphanumeric() -> Character {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
    }
    
    /// 生成多次重复的字符串
    ///
    ///     Character("-") * 5 -> "-----"
    ///
    /// - Parameters:
    ///   - lhs: 用于重复的字符
    ///   - rhs: 重复次数
    static func * (lhs: Character, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: lhs, count: rhs)
    }
    
    /// 生成多次重复的字符串
    ///
    ///     Character("a") * 5 -> "aaaaa"
    ///
    /// - Parameters:
    ///   - lhs: 重复次数
    ///   - rhs: 用于重复的字符
    static func * (lhs: Int, rhs: Character) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: rhs, count: lhs)
    }
}
