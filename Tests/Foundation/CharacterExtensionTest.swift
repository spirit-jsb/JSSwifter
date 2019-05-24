//
//  CharacterExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CharacterExtensionTest: XCTestCase {

    func test_is_emoji() {
        XCTAssertTrue(Character("😢").isEmoji)
        XCTAssertFalse(Character("a").isEmoji)
    }
    
    func test_is_number() {
        XCTAssertTrue(Character("1").isNumber)
        XCTAssertFalse(Character("_").isNumber)
    }
    
    func test_is_letter() {
        XCTAssertTrue(Character("a").isLetter)
        XCTAssertTrue(Character("T").isLetter)
        XCTAssertFalse(Character("1").isLetter)
        XCTAssertFalse(Character("_").isLetter)
    }
    
    func test_is_lowercased() {
        XCTAssertTrue(Character("s").isLowercased)
        XCTAssertFalse(Character("S").isLowercased)
    }
    
    func test_is_uppercased() {
        XCTAssertTrue(Character("S").isUppercased)
        XCTAssertFalse(Character("s").isUppercased)
    }
    
    func test_int() {
        XCTAssertEqual(Character("1").int, 1)
        XCTAssertNil(Character("s").int)
    }
    
    func test_string() {
        XCTAssertEqual(Character("S").string, String("S"))
    }
    
    func test_lowercased() {
        XCTAssertEqual(Character("C").lowercased, Character("c"))
    }
    
    func test_uppercased() {
        XCTAssertEqual(Character("s").uppercased, Character("S"))
    }
    
    func test_random_alphanumeric() {
        var string1 = String()
        var string2 = String()
        for _ in 0..<10 {
            string1.append(Character.randomAlphanumeric())
            string2.append(Character.randomAlphanumeric())
        }
        XCTAssertNotEqual(string1, string2)
    }
    
    func test_operators() {
        let sLetter = Character("s")
        XCTAssertEqual(sLetter * 5, "sssss")
        XCTAssertEqual(5 * sLetter, "sssss")
        
        XCTAssertEqual(sLetter * 0, "")
        XCTAssertEqual(0 * sLetter, "")
        
        XCTAssertEqual(sLetter * -5, "")
        XCTAssertEqual(-5 * sLetter, "")
    }
}
