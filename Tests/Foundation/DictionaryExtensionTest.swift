//
//  DictionaryExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class DictionaryExtensionTest: XCTestCase {

    var testDict: [String: Any] = ["testKey": "testValue", "testArrayKey": [1, 2, 3, 4, 5]]
    
    func test_has_key() {
        XCTAssertTrue(self.testDict.has(key: "testKey"))
        XCTAssertFalse(self.testDict.has(key: "otherKey"))
    }
    
    func test_remove_all() {
        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        dict.removeAll(keys: ["key1", "key3"])
        XCTAssertTrue(dict.keys.contains("key2"))
        XCTAssertFalse(dict.keys.contains("key1"))
        XCTAssertFalse(dict.keys.contains("key3"))
    }
    
    func test_remove_value_for_random_key() {
        var emptyDict = [String: String]()
        XCTAssertNil(emptyDict.removeValueForRandomKey())
        
        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        let elements = dict.count
        let removedElement = dict.removeValueForRandomKey()
        XCTAssertEqual(elements - 1, dict.count)
        XCTAssertFalse(dict.contains(where: { $0.value == removedElement }))
    }
    
    func test_map_keys_and_values() {
        let intToString = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9"]
        let stringToInt: [String: Int] = intToString.mapKeysAndValues { (String(describing: $0), Int($1)!) }
        XCTAssertEqual(stringToInt, ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9])
    }
    
    func test_compact_map_keys_and_values() {
        enum IntWord: String {
            case zero
            case one
            case two
        }
        let strings = [0: "zero", 1: "one", 2: "two", 3: "three"]
        let words: [String: IntWord] = strings.compactMapKeysAndValues { (key, value) in
            guard let word = IntWord(rawValue: value) else { return nil }
            return (String(describing: key), word)
        }
        XCTAssertEqual(words, ["0": .zero, "1": .one, "2": .two])
    }
    
    func test_json_decoded() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.dict.json", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let jsonDictionary = try [String: String].jsonDictionary(with: data)
        XCTAssertEqual(jsonDictionary.keys.count, 3)
        XCTAssertEqual(jsonDictionary.values.count, 3)
    }
    
    func test_json_decoded_error() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.json", withExtension: nil) else {
            return
        }
        
        var jsonDictionary: Any? = nil
        
        do {
            let data = try Data(contentsOf: url)
            jsonDictionary = try [String: String].jsonDictionary(with: data)
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! DictionaryError), DictionaryError.invalidType)
        }
        
        XCTAssertNil(jsonDictionary)
    }
    
    func test_plist_decoded() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.dict.plist", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let plistDictionary = try [String: String].plistDictionary(with: data)
        XCTAssertEqual(plistDictionary.keys.count, 3)
        XCTAssertEqual(plistDictionary.values.count, 3)
    }
    
    func test_plist_decoded_error() {
        var plistDictionary: Any? = nil
        
        do {
            plistDictionary = try [String: String].plistDictionary(with: Data())
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! DictionaryError), DictionaryError.invalidData)
        }
        
        XCTAssertNil(plistDictionary)
    }
    
    func test_json_encoded() throws {
        let jsonDictionary = ["item1": "a", "item2": "b", "item3": "c"]
        let data = try jsonDictionary.jsonData()
        XCTAssertFalse(data.isEmpty)
    }
    
    func test_json_encoded_error() {
        let jsonDictionary = ["person1": Person(name: "James", age: nil), "person2": Person(name: "Peter", age: 29)]
        var data: Data? = nil
        do {
            data = try jsonDictionary.jsonData()
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! DictionaryError), DictionaryError.invalidJSONObject)
        }
        XCTAssertNil(data)
    }
    
    func test_plist_encoded() throws {
        let plistDictionary = ["item1": "a", "item2": "b", "item3": "c"]
        let data = try plistDictionary.plistData()
        XCTAssertFalse(data.isEmpty)
    }
    
    func test_plist_encoded_error() {
        let plistDictionary = ["person1": Person(name: "James", age: nil), "person2": Person(name: "Peter", age: 29)]
        var data: Data? = nil
        do {
            data = try plistDictionary.plistData()
        }
        catch let error {
            XCTAssertNotNil(error)
        }
        XCTAssertNil(data)
    }

    func test_keys_for_value() {
        let dict = ["key1": "value1", "key2": "value1", "key3": "value3"]
        let result = dict.keys(forValue: "value1")
        XCTAssertTrue(result.contains("key1"))
        XCTAssertTrue(result.contains("key2"))
        XCTAssertFalse(result.contains("key3"))
    }
    
    func test_lowercase_all_keys() {
        var dict = ["tEstKeY": "value"]
        dict.lowercaseAllKeys()
        XCTAssertEqual(dict, ["testkey": "value"])
    }
    
    func test_subscript_path() {
        var json = ["key": ["key1": ["key2": "value2"]]]
        
        XCTAssertEqual(json[path: []] as? String, nil)
        XCTAssertEqual(json[path: ["key", "key1"]] as? [String: String], ["key2": "value2"])
        XCTAssertEqual(json[path: ["key", "key1", "key2"]] as? String, "value2")
        
        json[path: ["key", "key1", "key2"]] = "newValue2"
        XCTAssertEqual(json[path: ["key", "key1", "key2"]] as? String, "newValue2")
    }
    
    func test_operator_plus() {
        let dict1: [String: String] = ["key1": "value1"]
        let dict2: [String: String] = ["key2": "value2"]
        let result = dict1 + dict2
        XCTAssertTrue(result.keys.contains("key1"))
        XCTAssertTrue(result.keys.contains("key2"))
    }
    
    func test_operator_plus_equal() {
        var dict1: [String: String] = ["key1": "value1"]
        let dict2: [String: String] = ["key2": "value2"]
        dict1 += dict2
        XCTAssertTrue(dict1.keys.contains("key1"))
        XCTAssertTrue(dict1.keys.contains("key2"))
    }
    
    func test_operator_minus() {
        let dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        let result = dict - ["key1", "key2"]
        XCTAssertTrue(result.keys.contains("key3"))
        XCTAssertFalse(result.keys.contains("key2"))
        XCTAssertFalse(result.keys.contains("key1"))
    }
    
    func test_operator_minus_equal() {
        var dict: [String: String] = ["key1": "value1", "key2": "value2", "key3": "value3"]
        dict -= ["key1", "key2"]
        XCTAssertTrue(dict.keys.contains("key3"))
        XCTAssertFalse(dict.keys.contains("key2"))
        XCTAssertFalse(dict.keys.contains("key1"))
    }
}

private struct Person: Equatable {
    var name: String
    var age: Int?
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
