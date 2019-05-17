//
//  IntExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class IntExtensionTest: XCTestCase {

    func test_uInt() {
        XCTAssertEqual(Int(10).uInt, UInt(10))
    }
    
    func test_float() {
        XCTAssertEqual((-1).float, Float(-1))
        XCTAssertEqual(2.float, Float(2))
    }
    
    func test_double() {
        XCTAssertEqual((-1).double, Double(-1))
        XCTAssertEqual(2.double, Double(2))
    }
    
    func test_cgFloat() {
        XCTAssertEqual(1.cgFloat, CGFloat(1))
    }
    
    func test_is_prime() {
        // Prime number
        XCTAssertTrue(2.isPrime())
        XCTAssertTrue(3.isPrime())
        XCTAssertTrue(7.isPrime())
        XCTAssertTrue(19.isPrime())
        XCTAssertTrue(577.isPrime())
        XCTAssertTrue(1999.isPrime())
        
        // Composite number
        XCTAssertFalse(4.isPrime())
        XCTAssertFalse(21.isPrime())
        XCTAssertFalse(81.isPrime())
        XCTAssertFalse(121.isPrime())
        XCTAssertFalse(9409.isPrime())
        
        // Others
        XCTAssertFalse((-1).isPrime())
        XCTAssertFalse(0.isPrime())
        XCTAssertFalse(1.isPrime())
    }
    
    func test_operators() {
        XCTAssertEqual(5 ** 2, 25)
        XCTAssertTrue((5 ± 2) == (3, 7) || (5 ± 2) == (7, 3))
        XCTAssertTrue((±2) == (2, -2) || (±2) == (-2, 2))
        XCTAssertEqual(√25, 5.0)
    }
}
