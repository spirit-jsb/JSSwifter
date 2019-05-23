//
//  CollectionExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CollectionExtensionTest: XCTestCase {
    
    let collection = [1, 2, 3, 4, 5]
    
    func test_subscript_safe() {
        XCTAssertNotNil(self.collection[safe: 2])
        XCTAssertEqual(self.collection[safe: 1], 2)
        XCTAssertNil(self.collection[safe: 9])
    }
    
    func test_for_each_in_parallel() {
        self.collection.forEachInParallel { (item) in
            XCTAssertTrue(self.collection.contains(item))
        }
    }
    
    func test_indices_where() {
        let array = [0, 1, 2, 3, 4, 5, 6, 7, 9, 8]
        let indices = array.indices { $0 % 2 == 0 }
        XCTAssertEqual(indices, [0, 2, 4, 6, 9])
        let emptyArray: [Int] = []
        let emptyIndices = emptyArray.indices { $0 % 2 == 0 }
        XCTAssertNil(emptyIndices)
    }
    
    func test_for_each_slice() {
        var iterations: Int = 0
        
        var array: [String] = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii"]
        array.forEach(slice: 0, body: { (_) in
            iterations += 1
        })
        XCTAssertEqual(iterations, 0)
        
        iterations = 0
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii"]
        array.forEach(slice: 2, body: { (slices) in
            switch iterations {
            case 0:
                XCTAssertEqual(slices, ["sjsjsja", "qoomcka"])
            case 1:
                XCTAssertEqual(slices, ["lasj", "wopxa"])
            case 2:
                XCTAssertEqual(slices, ["lqoxla", "qoxiii"])
            default:
                break
            }
            iterations += 1
        })
        
        iterations = 0
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii", "oooqi"]
        array.forEach(slice: 2, body: { (slices) in
            switch iterations {
            case 0:
                XCTAssertEqual(slices, ["sjsjsja", "qoomcka"])
            case 1:
                XCTAssertEqual(slices, ["lasj", "wopxa"])
            case 2:
                XCTAssertEqual(slices, ["lqoxla", "qoxiii"])
            case 3:
                XCTAssertEqual(slices, ["oooqi"])
            default:
                break
            }
            iterations += 1
        })
        
        iterations = 0
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa"]
        array.forEach(slice: 4, body: { (slices) in
            switch iterations {
            case 0:
                XCTAssertEqual(slices, ["sjsjsja", "qoomcka", "lasj", "wopxa"])
            default:
                break
            }
            iterations += 1
        })
    }
    
    func test_group_by_size() {
        var array: [String] = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii"]
        var slices = array.group(by: 0)
        XCTAssertNil(slices)
        
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii"]
        slices = array.group(by: 2)
        XCTAssertNotNil(slices)
        XCTAssertEqual(slices?.count, 3)
        XCTAssertEqual(slices, [["sjsjsja", "qoomcka"], ["lasj", "wopxa"], ["lqoxla", "qoxiii"]])
        
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa", "lqoxla", "qoxiii", "oooqi"]
        slices = array.group(by: 2)
        XCTAssertNotNil(slices)
        XCTAssertEqual(slices?.count, 4)
        XCTAssertEqual(slices, [["sjsjsja", "qoomcka"], ["lasj", "wopxa"], ["lqoxla", "qoxiii"], ["oooqi"]])
        
        array = ["sjsjsja", "qoomcka", "lasj", "wopxa"]
        slices = array.group(by: 6)
        XCTAssertNotNil(slices)
        XCTAssertEqual(slices?.count, 1)
        XCTAssertEqual(slices, [["sjsjsja", "qoomcka", "lasj", "wopxa"]])
    }
    
    func test_average() {
        XCTAssertEqual([1.2, 2.4, 4.2, 3.1, 5.9].average(), 3.36, accuracy: 0.01)
        XCTAssertEqual([Double]().average(), 0.0)
        XCTAssertEqual([1, 2, 3, 4, 5].average(), 3)
        XCTAssertEqual([Int]().average(), 0)
    }
}
