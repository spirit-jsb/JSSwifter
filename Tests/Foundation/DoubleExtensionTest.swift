//
//  DoubleExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class DoubleExtensionTest: XCTestCase {

    func test_int() {
        XCTAssertEqual(Double(-1.0).int, -1)
        XCTAssertEqual(Double(2.0).int, 2)
        XCTAssertEqual(Double(4.3).int, 4)
    }
    
    func test_float() {
        XCTAssertEqual(Double(-1.0).float, Float(-1.0))
        XCTAssertEqual(Double(2.0).float, Float(2.0))
        XCTAssertEqual(Double(4.3).float, Float(4.3), accuracy: 0.00001)
    }
    
    func test_cgfloat() {
        XCTAssertEqual(Double(4.3).cgFloat, CGFloat(4.3), accuracy: 0.00001)
    }
    
    func test_operators() {
        XCTAssertEqual((Double(5.0) ** Double(2.0)), Double(25.0))
        XCTAssertEqual((√Double(25.0)), Double(5.0))
    }
}
