//
//  StringExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/24.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class StringExtensionTest: XCTestCase {

    func test_base_64_encoded() {
        XCTAssertEqual("Hello World!".base64Encoded, "SGVsbG8gV29ybGQh")
    }
    
    func test_base_64_decoded() {
        XCTAssertEqual("SGVsbG8gV29ybGQh".base64Decoded, "Hello World!")
        XCTAssertNil("Hello World!".base64Decoded)
    }
    
    func test_characters_array() {
        let string = "Swifter"
        let chars = [Character("S"), Character("w"), Character("i"), Character("f"), Character("t"), Character("e"), Character("r")]
        XCTAssertEqual(string.charactersArray, chars)
    }
    
    func test_contains_emoji() {
        XCTAssertTrue("Hello 😂".containsEmoji)
        XCTAssertFalse("Hello".containsEmoji)
    }
    
    func test_has_numbers() {
        XCTAssertTrue("123".hasNumbers)
        XCTAssertTrue("has 123 number".hasNumbers)
        XCTAssertFalse("has number".hasNumbers)
    }
    
    func test_has_letters() {
        XCTAssertFalse("123".hasLetters)
        XCTAssertTrue("has 123 number".hasLetters)
        XCTAssertTrue("has number".hasLetters)
    }
    
    func test_is_alphabetic() {
        XCTAssertTrue("abs".isAlphabetic)
        XCTAssertFalse("123abs".isAlphabetic)
        XCTAssertFalse("123".isAlphabetic)
    }
    
    func test_is_palindrome() {
        XCTAssertTrue("abcdcba".isPalindrome)
        XCTAssertTrue("Mom".isPalindrome)
        XCTAssertTrue("a Man a Plan a canal, PanAma!".isPalindrome)
        XCTAssertFalse("mAMA".isPalindrome)
        XCTAssertFalse("".isPalindrome)
    }
    
    func test_is_valid_email() {
        // https://blogs.msdn.microsoft.com/testing123/2009/02/06/email-address-test-cases/
        XCTAssertTrue("email@domain.com".isValidEmail)
        XCTAssertTrue("firstname.lastname@domain.com".isValidEmail)
        XCTAssertTrue("email@subdomain.domain.com".isValidEmail)
        XCTAssertTrue("firstname+lastname@domain.com".isValidEmail)
        XCTAssertTrue("email@123.123.123.123".isValidEmail)
        XCTAssertTrue("email@[123.123.123.123]".isValidEmail)
        XCTAssertTrue("\"email\"@domain.com".isValidEmail)
        XCTAssertTrue("1234567890@domain.com".isValidEmail)
        XCTAssertTrue("email@domain-one.com".isValidEmail)
        XCTAssertTrue("_______@domain.com".isValidEmail)
        XCTAssertTrue("email@domain.name".isValidEmail)
        XCTAssertTrue("email@domain.co.jp".isValidEmail)
        XCTAssertTrue("firstname-lastname@domain.com".isValidEmail)
        
        XCTAssertFalse("".isValidEmail)
        XCTAssertFalse("plainaddress".isValidEmail)
        XCTAssertFalse("#@%^%#$@#$@#.com".isValidEmail)
        XCTAssertFalse("@domain.com".isValidEmail)
        XCTAssertFalse("Joe Smith <email@domain.com>".isValidEmail)
        XCTAssertFalse("email.domain.com".isValidEmail)
        XCTAssertFalse("email@domain@domain.com".isValidEmail)
        XCTAssertFalse(".email@domain.com".isValidEmail)
        XCTAssertFalse("email.@domain.com".isValidEmail)
        XCTAssertFalse("email..email@domain.com".isValidEmail)
        XCTAssertFalse("email@domain.com (Joe Smith)".isValidEmail)
        XCTAssertFalse("email@domain".isValidEmail)
        XCTAssertFalse("email@-domain.com".isValidEmail)
        XCTAssertFalse(" email@domain.com".isValidEmail)
        XCTAssertFalse("email@domain.com ".isValidEmail)
        XCTAssertFalse("\nemail@domain.com".isValidEmail)
        XCTAssertFalse("nemail@domain.com   \n\n".isValidEmail)
    }
    
    func test_is_valid_url() {
        XCTAssertTrue("https://baidu.com".isValidURL)
        XCTAssertTrue("http://baidu.com".isValidURL)
        XCTAssertTrue("ftp://google.com".isValidURL)
    }
    
    func test_is_valid_schemed_url() {
        XCTAssertFalse("hello".isValidSchemedURL)
        XCTAssertFalse("baidu.com".isValidSchemedURL)
        XCTAssertTrue("https://baidu.com".isValidSchemedURL)
        XCTAssertTrue("http://baidu.com".isValidSchemedURL)
        XCTAssertTrue("ftp://google.com".isValidSchemedURL)
    }
    
    func test_is_valid_https_url() {
        XCTAssertFalse("hello".isValidHTTPsURL)
        XCTAssertTrue("https://baidu.com".isValidHTTPsURL)
        XCTAssertFalse("http://baidu.com".isValidHTTPsURL)
    }
    
    func test_is_valid_http_url() {
        XCTAssertFalse("hello".isValidHTTPURL)
        XCTAssertFalse("https://baidu.com".isValidHTTPURL)
        XCTAssertTrue("http://baidu.com".isValidHTTPURL)
    }
    
    func test_is_valid_file_url() {
        XCTAssertFalse("hello".isValidFileURL)
        XCTAssertTrue("file://var/folder/file.txt".isValidFileURL)
        XCTAssertFalse("https://baidu.com".isValidFileURL)
    }
    
    func test_is_number() {
        XCTAssertTrue("123".isNumber)
        XCTAssertTrue("123.4".isNumber)
        XCTAssertTrue("1.25e2".isNumber)
        XCTAssertTrue("1.25e-2".isNumber)
        XCTAssertTrue("000123.456".isNumber)
        XCTAssertFalse("123abc".isNumber)
        XCTAssertFalse("abc".isNumber)
        XCTAssertFalse("123.@.".isNumber)
    }
    
    func test_is_digits() {
        XCTAssertTrue("123".isDigits)
        XCTAssertTrue("987654321".isDigits)
        XCTAssertFalse("123.4".isDigits)
        XCTAssertFalse("1.25e2".isDigits)
        XCTAssertFalse("123abc".isDigits)
    }
    
    func test_first_character_as_string() {
        XCTAssertNotNil("Hello".firstCharacterAsString)
        XCTAssertEqual("Hello".firstCharacterAsString, "H")
        XCTAssertNil("".firstCharacterAsString)
    }
    
    func test_last_character_as_string() {
        XCTAssertNotNil("Hello".lastCharacterAsString)
        XCTAssertEqual("Hello".lastCharacterAsString, "o")
        XCTAssertNil("".lastCharacterAsString)
    }
    
    func test_bool() {
        XCTAssertTrue("1".bool!)
        XCTAssertTrue("true".bool!)
        XCTAssertTrue("Yes".bool!)
        XCTAssertFalse("0".bool!)
        XCTAssertFalse("FaLsE".bool!)
        XCTAssertFalse("NO".bool!)
        XCTAssertNil("".bool)
    }
    
    func test_int() {
        XCTAssertEqual("9".int, 9)
        XCTAssertNil("0s".int)
    }
    
    func test_float() {
        XCTAssertEqual("9".float, Float(9.0))
        XCTAssertNil("0s".float)
    }
    
    func test_double() {
        XCTAssertEqual("9.1".double, Double(9.1))
        XCTAssertNil("0s".int)
    }
    
    func test_cgfloat() {
        XCTAssertEqual("2.12".cgFloat, CGFloat(2.12))
        XCTAssertNil("0s".cgFloat)
    }
    
    func test_url() {
        XCTAssertNil("Hello World!".url)
        XCTAssertEqual("www.baidu.com".url, URL(string: "www.baidu.com"))
    }
}
