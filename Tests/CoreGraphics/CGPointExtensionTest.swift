//
//  CGPointExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CGPointExtensionTest: XCTestCase {

    let point1 = CGPoint(x: 10.0, y: 10.0)
    let point2 = CGPoint(x: 30.0, y: 30.0)
    
    func test_distance() {
        let distance1 = self.point1.distance(to: self.point2)
        XCTAssertEqual(distance1, 28.28, accuracy: 0.01)
        let distance2 = CGPoint.distance(from: self.point1, to: self.point2)
        XCTAssertEqual(distance2, 28.28, accuracy: 0.01)
    }
    
    func test_add() {
        let result = self.point1 + self.point2
        XCTAssertEqual(result, CGPoint(x: 40.0, y: 40.0))
    }
    
    func test_add_equal() {
        var result = self.point1
        result += point2
        XCTAssertEqual(result, CGPoint(x: 40.0, y: 40.0))
    }
    
    func test_subtract() {
        let result = self.point1 - self.point2
        XCTAssertEqual(result, CGPoint(x: -20.0, y: -20.0))
    }
    
    func test_subtract_equal() {
        var result = self.point1
        result -= point2
        XCTAssertEqual(result, CGPoint(x: -20.0, y: -20.0))
    }
    
    func test_multiply_scalar() {
        let result1 = self.point1 * 5.0
        XCTAssertEqual(result1, CGPoint(x: 50.0, y: 50.0))
        let result2 = 5.0 * self.point1
        XCTAssertEqual(result2, CGPoint(x: 50.0, y: 50.0))
    }
    
    func test_multiply_scalar_equal() {
        var result = self.point1
        result *= 5.0
        XCTAssertEqual(result, CGPoint(x: 50.0, y: 50.0))
    }
}
