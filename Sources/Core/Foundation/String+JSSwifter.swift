//
//  String+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/25.
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
    
    var urlEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    var urlDecoded: String? {
        return self.removingPercentEncoding
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
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = false
        return formatter.number(from: self)?.intValue
    }
    
    var float: Float? {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        return formatter.number(from: self)?.floatValue
    }
    
    var double: Double? {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        return formatter.number(from: self)?.doubleValue
    }
    
    var cgFloat: CGFloat? {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        return formatter.number(from: self) as? CGFloat
    }
    
    var url: URL? {
        return URL(string: self)
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var withoutSpacesAndNewLines: String {
        return self.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
    }
    
    // MARK:
    subscript(safe index: Int) -> Character? {
        guard index >= 0 && index < self.count else { return nil }
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(safe range: CountableRange<Int>) -> String? {
        guard let lowerIndex = self.index(self.startIndex, offsetBy: max(0, range.lowerBound), limitedBy: self.endIndex) else
        {
            return nil
        }
        guard let upperIndex = self.index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: self.endIndex) else
        {
            return nil
        }
        return String(self[lowerIndex..<upperIndex])
    }
    
    subscript(safe range: ClosedRange<Int>) -> String? {
        guard let lowerIndex = self.index(self.startIndex, offsetBy: max(0, range.lowerBound), limitedBy: self.endIndex) else
        {
            return nil
        }
        guard let upperIndex = self.index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: self.endIndex) else
        {
            return nil
        }
        return String(self[lowerIndex..<upperIndex])
    }
    
    static func random(ofLength length: Int) -> String {
        guard length > 0 else { return "" }
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        return randomString
    }
    
    func lines() -> [String] {
        var result = [String]()
        self.enumerateLines { (line, _) in
            result.append(line)
        }
        return result
    }
    
    func unicodesArray() -> [Int] {
        return self.unicodeScalars.map { Int($0.value) }
    }
    
    func words() -> [String] {
        // https://stackoverflow.com/questions/42822838
        let characterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = self.components(separatedBy: characterSet)
        return comps.filter { !$0.isEmpty }
    }
    
    func matches(pattern: String) -> Bool {
        return self.range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func starts(with prefix: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return self.lowercased().hasPrefix(prefix.lowercased())
        }
        return self.hasPrefix(prefix)
    }
    
    func ends(with suffix: String, caseSensitive: Bool = true) -> Bool {
        if !caseSensitive {
            return self.lowercased().hasSuffix(suffix.lowercased())
        }
        return self.hasSuffix(suffix)
    }
    
    func slicing(from index: Int, length: Int) -> String? {
        guard length >= 0, index >= 0, index < self.count else { return nil }
        guard length > 0 else { return "" }
        guard index.advanced(by: length) <= self.count else { return self[safe: index..<self.count] }
        return self[safe: index..<index.advanced(by: length)]
    }
    
    @discardableResult
    mutating func slice(from index: Int, length: Int) -> String {
        if let str = self.slicing(from: index, length: length) {
            self = str
        }
        return self
    }
    
    @discardableResult
    mutating func slice(from start: Int, to end: Int) -> String {
        guard end >= start else { return self }
        if let str = self[safe: start..<end] {
            self = str
        }
        return self
    }
    
    @discardableResult
    mutating func slice(at index: Int) -> String {
        guard index < self.count else { return self }
        if let str = self[safe: index..<self.count] {
            self = str
        }
        return self
    }
    
    func truncated(toLength length: Int, trailing: String? = "...") -> String {
        guard 1..<self.count ~= length else { return self }
        return self[self.startIndex..<self.index(self.startIndex, offsetBy: length)] + (trailing ?? "")
    }
    
    @discardableResult
    mutating func truncate(toLength length: Int, trailing: String? = "...") -> String {
        guard 1..<self.count ~= length else { return self }
        self = self[self.startIndex..<self.index(self.startIndex, offsetBy: length)] + (trailing ?? "")
        return self
    }
    
    func removePrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func removeSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    func paddingStart(_ length: Int, with string: String = " ") -> String {
        guard length > self.count else { return self }
        
        let padLenght = length - self.count
        if padLenght < string.count {
            return string[string.startIndex..<string.index(string.startIndex, offsetBy: padLenght)] + self
        }
        else {
            var padding = string
            while padding.count < padLenght {
                padding.append(string)
            }
            return padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLenght)] + self
        }
    }
    
    @discardableResult
    mutating func padStart(_ length: Int, with string: String = " ") -> String {
        self = self.paddingStart(length, with: string)
        return self
    }
    
    func paddingEnd(_ length: Int, with string: String = " ") -> String {
        guard length > self.count else { return self }
        
        let padLenght = length - self.count
        if padLenght < string.count {
            return self + string[string.startIndex..<string.index(string.startIndex, offsetBy: padLenght)]
        }
        else {
            var padding = string
            while padding.count < padLenght {
                padding.append(string)
            }
            return self + padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLenght)]
        }
    }
    
    @discardableResult
    mutating func padEnd(_ length: Int, with string: String = " ") -> String {
        self = self.paddingEnd(length, with: string)
        return self
    }
    
    static func * (lhs: String, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: lhs, count: rhs)
    }
    
    static func * (lhs: Int, rhs: String) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: rhs, count: lhs)
    }
}
