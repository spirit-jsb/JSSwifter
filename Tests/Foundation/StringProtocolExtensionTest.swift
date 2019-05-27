//
//  StringProtocolExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/25.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class StringProtocolExtensionTest: XCTestCase {

    func test_common_suffix() {
        let string1 = "Hello world!"
        
        XCTAssertTrue("".commonSuffix(with: "It's cold!").isEmpty)
        XCTAssertTrue(string1.commonSuffix(with: "").isEmpty)
        
        XCTAssertEqual(string1.commonSuffix(with: "It's cold!"), "ld!")
        XCTAssertEqual(string1.commonSuffix(with: "ld!"), "ld!")
        XCTAssertEqual(string1.commonSuffix(with: "Not Common"), "")
        XCTAssertEqual(string1.commonSuffix(with: "It;s colD!"), "!")
        XCTAssertEqual(string1.commonSuffix(with: "Hello world!"), "Hello world!")
        XCTAssertEqual(string1.commonSuffix(with: "It's colD!", options: .caseInsensitive), "ld!")
        XCTAssertEqual(string1.commonSuffix(with: "It's cold!", options: .literal), "ld!")
        XCTAssertEqual("Pelé".commonSuffix(with: "ele"), "")
        XCTAssertEqual("Pelé".commonSuffix(with: "ele", options: .diacriticInsensitive), "elé")
        
        XCTAssertEqual("huea\u{308}hue".commonSuffix(with: "hue\u{E4}hue"), "huea\u{308}hue")
        XCTAssertEqual("hue\u{308}hue".commonSuffix(with: "hue\u{E4}hue", options: .literal), "hue")
        XCTAssertEqual("hue\u{308}hue".commonSuffix(with: "hue\u{E4}hUe", options: [.caseInsensitive, .literal]), "hue")
        
        XCTAssertEqual(string1.commonSuffix(with: "你好世界"), "")
    }
}
