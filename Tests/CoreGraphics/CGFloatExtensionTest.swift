//
//  CGFloatExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CGFloatExtensionTest: XCTestCase {

    func test_abs() {
        XCTAssertEqual(CGFloat(-9.3).abs, CGFloat(9.3))
    }
    
    func test_ceil() {
        XCTAssertEqual(CGFloat(9.3).ceil, CGFloat(10.0))
    }
    
    func test_floor() {
        XCTAssertEqual(CGFloat(9.3).floor, CGFloat(9.0))
    }
    
    func test_degrees_to_radians() {
        XCTAssertEqual(CGFloat(180.0).degreesToRadians, CGFloat.pi)
    }
    
    func test_radians_to_degrees() {
        XCTAssertEqual(CGFloat.pi.radiansToDegrees, CGFloat(180.0))
    }
    
    func test_is_positive() {
        XCTAssertTrue(CGFloat(9.3).isPositive)
        XCTAssertFalse(CGFloat(0.0).isPositive)
        XCTAssertFalse(CGFloat(-9.3).isPositive)
    }
    
    func test_is_negative() {
        XCTAssertTrue(CGFloat(-9.3).isNegative)
        XCTAssertFalse(CGFloat(0.0).isNegative)
        XCTAssertFalse(CGFloat(9.3).isNegative)
    }
    
    func test_int() {
        XCTAssertEqual(CGFloat(9.3).int, Int(9))
    }
    
    func test_float() {
        XCTAssertEqual(CGFloat(9.3).float, Float(9.3))
    }
    
    func test_double() {
        XCTAssertEqual(CGFloat(9.3).double, Double(9.3))
    }
}
