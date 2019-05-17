//
//  CGColorExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CGColorExtensionTest: XCTestCase {

    func test_uicolor() {
        let red = UIColor.red
        let cgRed = red.cgColor
        XCTAssertEqual(cgRed.uiColor, red)
    }
}
