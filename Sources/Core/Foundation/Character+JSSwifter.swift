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
    
    var isNumber: Bool {
        return Int(String(self)) != nil
    }
    
    var isLetter: Bool {
        return String(self).rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    var isLowercased: Bool {
        return String(self) == String(self).lowercased()
    }
    
    var isUppercased: Bool {
        return String(self) == String(self).uppercased()
    }
    
    var int: Int? {
        return Int(String(self))
    }
    
    var float: Float? {
        return Float(String(self))
    }
    
    var double: Double? {
        return Double(String(self))
    }
    
    var string: String {
        return String(self)
    }
    
    var lowercased: Character {
        return String(self).lowercased().first!
    }
    
    var uppercased: Character {
        return String(self).uppercased().first!
    }
    
    // MARK:
    static func randomAlphanumeric() -> Character {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
    }
    
    static func * (lhs: Character, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: lhs, count: rhs)
    }
    
    static func * (lhs: Int, rhs: Character) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: rhs, count: lhs)
    }
}
