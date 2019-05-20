//
//  ArrayExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/20.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class ArrayExtensionTest: XCTestCase {
    
    func test_safe() {
        var array = [0, 1, 2, 3, 4]
        XCTAssertEqual(array[safe: 3], 3)
        XCTAssertNil(array[safe: 5])
        
        array[safe: 2] = 10
        XCTAssertEqual(array[safe: 2], 10)
        array[safe: 10] = 100
        XCTAssertEqual(array, [0, 1, 10, 3, 100])
    }

    func test_prepend() {
        var array = [2, 3, 4, 5]
        array.prepend(1)
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
    }
    
    func test_safe_swap() {
        var array = [1, 2, 3, 4, 5]
        array.safeSwap(from: 3, to: 0)
        XCTAssertEqual(array[3], 1)
        XCTAssertEqual(array[0], 4)
        
        var newArray = array
        newArray.safeSwap(from: 1, to: 1)
        XCTAssertEqual(newArray, array)
        
        newArray = array
        newArray.safeSwap(from: 1, to: 12)
        XCTAssertEqual(newArray, array)
        
        let emptyArray = [Int]()
        var swappedEmptyArray = emptyArray
        swappedEmptyArray.safeSwap(from: 1, to: 3)
        XCTAssertEqual(swappedEmptyArray, emptyArray)
    }
    
    func test_divided() {
        let input = [0, 1, 2, 3, 4, 5]
        let (even, odd) = input.divided { $0 % 2 == 0 }
        XCTAssertEqual(even, [0, 2, 4])
        XCTAssertEqual(odd, [1, 3, 5])
        
        let tuple = input.divided { $0 % 2 == 0 }
        XCTAssertEqual(tuple.matching, [0, 2, 4])
        XCTAssertEqual(tuple.0, [0, 2, 4])
        XCTAssertEqual(tuple.nonMatching, [1, 3, 5])
        XCTAssertEqual(tuple.1, [1, 3, 5])
    }
    
    func test_sorted_by_key_path() {
        let array = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
        
        XCTAssertEqual(array.sorted(by: \Person.name), [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)])
        XCTAssertEqual(array.sorted(by: \Person.name, ascending: false), [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)])
        
        XCTAssertEqual(array.sorted(by: \Person.age), [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)])
        XCTAssertEqual(array.sorted(by: \Person.age, ascending: false), [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)])
        
        var mutableArray = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
        
        XCTAssertEqual(mutableArray.sort(by: \Person.name), [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)])
        XCTAssertEqual(mutableArray.sort(by: \Person.age), [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)])
        
        let nilArray = [Person(name: "James", age: nil), Person(name: "Wade", age: 23)]
        XCTAssertEqual(nilArray.sorted(by: \Person.age), [Person(name: "James", age: nil), Person(name: "Wade", age: 23)])
    }
    
    func test_remove_all() {
        var array = [0, 1, 2, 0, 3, 4, 5, 0, 0]
        array.removeAll(0)
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
        array = [Int]()
        array.removeAll(0)
        XCTAssertEqual(array, [Int]())
    }
    
    func test_remove_all_items() {
        var array = [0, 1, 2, 2, 0, 3, 4, 5, 0, 0]
        array.removeAll([0, 2])
        XCTAssertEqual(array, [1, 3, 4, 5])
        array.removeAll([])
        XCTAssertEqual(array, [1, 3, 4, 5])
        array = [Int]()
        array.removeAll([0, 2])
        XCTAssertEqual(array, [Int]())
        array.removeAll([])
        XCTAssertEqual(array, [Int]())
        
    }
    
    func test_remove_duplicates() {
        var array = [1, 1, 2, 2, 3, 3, 3, 4, 5]
        array.removeDuplicates()
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
    }
    
    func test_without_duplicates() {
        var array: [Any] = [1, 1, 2, 2, 3, 3, 3, 4, 5]
        array = (array as! [Int]).withoutDuplicates()
        XCTAssertEqual((array as! [Int]), [1, 2, 3, 4, 5])
        array = ["h", "e", "l", "l", "o"]
        array = (array as! [String]).withoutDuplicates()
        XCTAssertEqual((array as! [String]), ["h", "e", "l", "o"])
    }
    
    func test_json_decoded() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.json", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let jsonArray = try [String].jsonArray(with: data)
        XCTAssertEqual(jsonArray.count, 3)
    }
    
    func test_json_decoded_error() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.json", withExtension: nil) else {
            return
        }
        
        var jsonArray: Any? = nil
        
        do {
            let data = try Data(contentsOf: url)
            jsonArray = try [Int].jsonArray(with: data)
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! ArrayError), ArrayError.invalidType)
        }
        
        XCTAssertNil(jsonArray)
    }
    
    func test_plist_decoded() throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.plist", withExtension: nil) else {
            return
        }
        let data = try Data(contentsOf: url)
        let plistArray = try [String].plistArray(with: data)
        XCTAssertEqual(plistArray.count, 3)
    }
    
    func test_plist_decoded_error() {
        guard let url = Bundle(for: type(of: self)).url(forResource: "test.plist", withExtension: nil) else {
            return
        }
        
        var plistArray: Any? = nil
        
        do {
            let data = try Data(contentsOf: url)
            plistArray = try [Int].plistArray(with: data)
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! ArrayError), ArrayError.invalidType)
        }
        
        XCTAssertNil(plistArray)
    }
    
    func test_json_encoded() throws {
        let jsonArray = [1, 2, 3]
        let data = try jsonArray.jsonData()
        XCTAssertFalse(data.isEmpty)
    }
    
    func test_json_encoded_error() {
        let jsonArray = [Person(name: "James", age: nil), Person(name: "Peter", age: 29)]
        var data: Data? = nil
        do {
            data = try jsonArray.jsonData()
        }
        catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual((error as! ArrayError), ArrayError.invalidJSONObject)
        }
        XCTAssertNil(data)
    }
    
    func test_plist_encoded() throws {
        let plistArray = ["1", "2", "3"]
        let data = try plistArray.plistData()
        XCTAssertFalse(data.isEmpty)
    }
    
    func test_plist_encoded_error() {
        let plistArray = [Person(name: "James", age: nil), Person(name: "Peter", age: 29)]
        var data: Data? = nil
        do {
            data = try plistArray.plistData()
        }
        catch let error {
            XCTAssertNotNil(error)
        }
        XCTAssertNil(data)
    }
}

private struct Person: Equatable {
    var name: String
    var age: Int?
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
