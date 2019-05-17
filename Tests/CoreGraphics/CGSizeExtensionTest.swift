//
//  CGSizeExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CGSizeExtensionTest: XCTestCase {
    
    func test_aspect_ratio() {
        let size1 = CGSize(width: 10.0, height: 0.0)
        XCTAssertEqual(size1.aspectRatio, 0.0)
        let size2 = CGSize(width: 20.0, height: 10.0)
        XCTAssertEqual(size2.aspectRatio, 2.0)
    }
    
    func test_max_dimension() {
        let size1 = CGSize(width: 10.0, height: 0.0)
        XCTAssertEqual(size1.maxDimension, 10.0)
        let size2 = CGSize(width: 20.0, height: 40.0)
        XCTAssertEqual(size2.maxDimension, 40.0)
    }
    
    func test_min_dimension() {
        let size1 = CGSize(width: 10.0, height: 0.0)
        XCTAssertEqual(size1.minDimension, 0.0)
        let size2 = CGSize(width: 20.0, height: 40.0)
        XCTAssertEqual(size2.minDimension, 20.0)
    }
    
    func test_aspect_fit() {
        let size = CGSize(width: 120.0, height: 80.0)
        let parentSize = CGSize(width: 100.0, height: 50.0)
        XCTAssertEqual(size.aspectFit(to: parentSize), CGSize(width: 75.0, height: 50.0))
    }
    
    func test_aspect_fill() {
        let size = CGSize(width: 20.0, height: 120.0)
        let parentSize = CGSize(width: 100.0, height: 60.0)
        XCTAssertEqual(size.aspectFill(to: parentSize), CGSize(width: 100.0, height: 60.0))
    }
    
    func test_add() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        let result = size1 + size2
        XCTAssertEqual(result, CGSize(width: 8.0, height: 14.0))
    }
    
    func test_add_equal() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        var result = size1
        result += size2
        XCTAssertEqual(result, CGSize(width: 8.0, height: 14.0))
    }
    
    func test_subtract() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        let result = size1 - size2
        XCTAssertEqual(result, CGSize(width: 2.0, height: 6.0))
    }
    
    func test_subtract_equal() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        var result = size1
        result -= size2
        XCTAssertEqual(result, CGSize(width: 2.0, height: 6.0))
    }
    
    func test_multiply() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        let result = size1 * size2
        XCTAssertEqual(result, CGSize(width: 15.0, height: 40.0))
    }
    
    func test_multiply_equal() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let size2 = CGSize(width: 3.0, height: 4.0)
        var result = size1
        result *= size2
        XCTAssertEqual(result, CGSize(width: 15.0, height: 40.0))
    }
    
    func test_multiply_scalar() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        let result1 = size1 * 5.0
        XCTAssertEqual(result1, CGSize(width: 25.0, height: 50.0))
        let result2 = 5.0 * size1
        XCTAssertEqual(result2, CGSize(width: 25.0, height: 50.0))
    }
    
    func test_multiply_scalar_equal() {
        let size1 = CGSize(width: 5.0, height: 10.0)
        var result = size1
        result *= 5.0
        XCTAssertEqual(result, CGSize(width: 25.0, height: 50.0))
    }
}
