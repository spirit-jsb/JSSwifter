//
//  ComparableExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class ComparableExtensionTest: XCTestCase {

    func test_is_between() {
        XCTAssertFalse(1.isBetween(5...8), "Int Range")
        XCTAssertTrue(7.isBetween(3...8), "Int Range")
        XCTAssertTrue(0.77.isBetween(0.1...0.9), "Float Range")
        XCTAssertTrue("c".isBetween("a"..."d"), "String Range")
        let date = Date()
        XCTAssertTrue(date.isBetween(date...date.addingTimeInterval(1000)), "Date Range")
    }
    
    func test_clamped() {
        XCTAssertEqual(1.clamped(to: 3...8), 3)
        XCTAssertEqual(4.clamped(to: 3...7), 4)
        XCTAssertEqual(0.32.clamped(to: 0.32...0.33), 0.32)
        XCTAssertEqual("c".clamped(to: "e"..."g"), "e")
    }
}
