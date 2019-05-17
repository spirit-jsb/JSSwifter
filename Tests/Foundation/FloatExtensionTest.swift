//
//  FloatExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class FloatExtensionTest: XCTestCase {

    func test_int() {
        XCTAssertEqual(Float(-1.0).int, -1)
        XCTAssertEqual(Float(2.0).int, 2)
        XCTAssertEqual(Float(4.3).int, 4)
    }
    
    func test_double() {
        XCTAssertEqual(Float(-1.0).double, Double(-1.0))
        XCTAssertEqual(Float(2.0).double, Double(2.0))
        XCTAssertEqual(Float(4.3).double, Double(4.3), accuracy: 0.00001)
    }
    
    func test_cgfloat() {
        XCTAssertEqual(Float(4.3).cgFloat, CGFloat(4.3), accuracy: 0.00001)
    }
    
    func test_operators() {
        XCTAssertEqual((Float(5.0) ** Float(2.0)), Float(25.0))
        XCTAssertEqual((√Float(25.0)), Float(5.0))
    }
}
