//
//  LocaleExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class LocaleExtensionTest: XCTestCase {

    func test_posix() {
        let locale: Locale = .posix
        XCTAssertEqual(locale.identifier, "en_US_POSIX")
    }
}
