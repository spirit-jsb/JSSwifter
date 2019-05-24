//
//  String+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/24.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension String {
    
    // MARK:
    var base64Encoded: String? {
        let encodeData = self.data(using: .utf8)
        return encodeData?.base64EncodedString()
    }
    
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    var charactersArray: [Character] {
        return Array(self)
    }
    
    var containsEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in self.unicodeScalars {
            switch scalar.value {
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
                continue
            }
        }
        return false
    }
    
    var hasNumbers: Bool {
        return self.rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
    }
    
    var hasLetters: Bool {
        return self.rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
    }
    
    var isAlphabetic: Bool {
        let hasNumbers: Bool = self.rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
        let hasLetters: Bool = self.rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
        return !hasNumbers && hasLetters
    }
    
    var isPalindrome: Bool {
        let letters = self.filter { $0.isLetter }
        guard !letters.isEmpty else { return false }
        let midIndex = letters.index(letters.startIndex, offsetBy: letters.count / 2)
        let firstHalf = letters[letters.startIndex..<midIndex]
        let secondHalf = letters[midIndex..<letters.endIndex].reversed()
        return !zip(firstHalf, secondHalf).contains(where: { $0.lowercased() != $1.lowercased() })
    }
    
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    var isValidURL: Bool {
        return URL(string: self) != nil
    }
    
    var isValidSchemedURL: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    
    var isValidHTTPsURL: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }
    
    var isValidHTTPURL: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }
    
    var isValidFileURL: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    
    var isNumber: Bool {
        let scanner = Scanner(string: self)
        scanner.locale = Locale.current
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    
    var isDigits: Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    var firstCharacterAsString: String? {
        guard let first = self.first else { return nil }
        return String(first)
    }
    
    var lastCharacterAsString: String? {
        guard let last = self.last else { return nil }
        return String(last)
    }
    
    var bool: Bool? {
        let lowercased = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()
        switch lowercased {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    var int: Int? {
        return Int(self)
    }
    
    var float: Float? {
        return Float(self)
    }
    
    var double: Double? {
        return Double(self)
    }
    
    var url: URL? {
        return URL(string: self)
    }
    
    // MARK:
    func int(locale: Locale = .current) -> Int? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = false
        return formatter.number(from: self)?.intValue
    }
    
    func float(locale: Locale = .current) -> Float? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.floatValue
    }
    
    func double(locale: Locale = .current) -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self)?.doubleValue
    }
    
    func cgFloat(locale: Locale = .current) -> CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = locale
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
}
