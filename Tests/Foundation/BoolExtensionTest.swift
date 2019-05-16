//
//  BoolExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class BoolExtensionTest: XCTestCase {

    func test_int() {
        XCTAssertEqual(true.int, 1)
        XCTAssertEqual(false.int, 0)
    }
    
    func test_string() {
        XCTAssertEqual(true.string, "true")
        XCTAssertEqual(false.string, "false")
    }
}
