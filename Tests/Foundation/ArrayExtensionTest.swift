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
}

private struct Person: Equatable {
    var name: String
    var age: Int?
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
