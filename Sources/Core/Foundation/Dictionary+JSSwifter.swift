//
//  Dictionary+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/20.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

/// Dictionary Decoder/Encoder Error
///
/// - invalidData: 无效的 Data
/// - invalidString: 无效的 String
/// - invalidType: 无效的解析类型
/// - invalidJSONObject: 无效的 JSON Object
public enum DictionaryError: Swift.Error {
    case invalidData
    case invalidString
    case invalidType
    case invalidJSONObject
}

public extension Dictionary {
    
    // MARK:
    
    /// 检查指定 Dictionary 中是否包含给定 key
    ///
    ///     let testDict: [String: Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    ///     self.testDict.has(key: "testKey") -> true
    ///     self.testDict.has(key: "otherKey") -> false
    ///
    func has(key: Key) -> Bool {
        return self.index(forKey: key) != nil
    }
    
    /// 从指定 Dictionary 中移除给定 keys 中所包含的有所 key
    ///
    ///     var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
    ///     dict.removeAll(keys: ["key1", "key3"])
    ///     dict.keys.contains("key2") -> true
    ///     dict.keys.contains("key1") -> false
    ///
    /// - Parameter keys: 需要移除的 keys
    mutating func removeAll<S: Sequence>(keys: S) where S.Element == Key {
        keys.forEach { self.removeValue(forKey: $0) }
    }
    
    /// 从指定 Dictionary 随机移除 key
    @discardableResult
    mutating func removeValueForRandomKey() -> Value? {
        guard let randomKey = self.keys.randomElement() else { return nil }
        return self.removeValue(forKey: randomKey)
    }
    
    func mapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try self.map(transform))
    }
    
    func compactMapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)?) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try self.compactMap(transform))
    }
    
    func jsonData(_ options: JSONSerialization.WritingOptions = []) throws -> Data {
        guard JSONSerialization.isValidJSONObject(self) else {
            throw DictionaryError.invalidJSONObject
        }
        return try JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    func plistData(_ options: PropertyListSerialization.WriteOptions = 0) throws -> Data {
        return try PropertyListSerialization.data(fromPropertyList: self, format: .xml, options: options)
    }
    
    static func jsonDictionary(with data: Data?, options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        guard let jsonData = data, !jsonData.isEmpty else {
            throw DictionaryError.invalidData
        }
        let json = try jsonData.jsonValueDecoded(options: options)
        guard let jsonDictionary = json as? [String: Any] else {
            throw DictionaryError.invalidType
        }
        return jsonDictionary
    }
    
    static func plistDictionary(with data: Data?, options: PropertyListSerialization.ReadOptions = []) throws -> [String: Any] {
        guard let plistData = data, !plistData.isEmpty else {
            throw DictionaryError.invalidData
        }
        let plist = try plistData.plistValueDecoded(options: options)
        guard let plistDictionary = plist as? [String: Any] else {
            throw DictionaryError.invalidType
        }
        return plistDictionary
    }
}

public extension Dictionary where Value: Equatable {
    
    // MARK:
    func keys(forValue value: Value) -> [Key] {
        return self.keys.filter { self[$0] == value }
    }
}

public extension Dictionary where Key: StringProtocol {
    
    // MARK:
    mutating func lowercaseAllKeys() {
        for key in self.keys {
            if let lowercasedKey = String(describing: key).lowercased() as? Key {
                self[lowercasedKey] = self.removeValue(forKey: key)
            }
        }
    }
}

public extension Dictionary {
    
    // MARK:
    subscript(path path: [Key]) -> Any? {
        set {
            if let first = path.first {
                if path.count == 1, let new = newValue as? Value {
                    return self[first] = new
                }
                if var nested = self[first] as? [Key: Any] {
                    nested[path: Array(path.dropFirst())] = newValue
                    return self[first] = nested as? Value
                }
            }
        }
        get {
            guard !path.isEmpty else { return nil }
            var result: Any? = self
            for key in path {
                if let element = (result as? [Key: Any])?[key] {
                    result = element
                }
                else {
                    return nil
                }
            }
            return result
        }
    }
}

public extension Dictionary {
    
    // MARK:
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        rhs.forEach { result[$0] = $1 }
        return result
    }
    
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) {
        rhs.forEach { lhs[$0] = $1 }
    }
    
    static func - <S: Sequence>(lhs: [Key: Value], keys: S) -> [Key: Value] where S.Element == Key {
        var result = lhs
        result.removeAll(keys: keys)
        return result
    }
    
    static func -= <S: Sequence>(lhs: inout [Key: Value], keys: S) where S.Element == Key {
        lhs.removeAll(keys: keys)
    }
}
