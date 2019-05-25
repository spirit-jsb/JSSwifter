//
//  StringExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/25.
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
    
    func test_url_encoded() {
        XCTAssertEqual("url encoded test".urlEncoded, "url%20encoded%20test")
    }
    
    func test_url_decoded() {
        XCTAssertEqual("url%20encoded%20test".urlDecoded, "url encoded test")
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
    
    func test_trimmed() {
        XCTAssertEqual("\n  hellO \n".trimmed, "hellO")
    }
    
    func test_without_spaces_and_new_lines() {
        XCTAssertEqual("Hello \n Test \n".withoutSpacesAndNewLines, "HelloTest")
    }
    
    func test_subscript_safe() {
        let str = "Hello world!"
        
        XCTAssertEqual(str[safe: 1], "e")
        XCTAssertNil(str[safe: 16])
        
        XCTAssertEqual(str[safe: 1..<6], "ello ")
        XCTAssertNil(str[safe: 9..<14])
        XCTAssertNil(""[safe: 1..<3])
        
        XCTAssertEqual(str[safe: 1...6], "ello w")
        XCTAssertNil(str[safe: 9...14])
        XCTAssertNil(""[safe: 1...3])
    }
    
    func test_random_of_length() {
        let str1 = String.random(ofLength: 10)
        XCTAssertEqual(str1.count, 10)
        let str2 = String.random(ofLength: 10)
        XCTAssertEqual(str2.count, 10)
        XCTAssertNotEqual(str1, str2)
        let str3 = String.random(ofLength: 0)
        XCTAssertEqual(str3, "")
    }
    
    func test_lines() {
        XCTAssertEqual("Hello\ntest".lines(), ["Hello", "test"])
    }
    
    func test_unicodes_array() {
        XCTAssertEqual("Hello".unicodesArray(), [72, 101, 108, 108, 111])
    }
    
    func test_words() {
        XCTAssertEqual("Hello World Test".words(), ["Hello", "World", "Test"])
    }
    
    func test_matches_pattern() {
        XCTAssertTrue("123".matches(pattern: "\\d{3}"))
        XCTAssertFalse("dasda".matches(pattern: "\\d{3}"))
        XCTAssertFalse("notanemail.com".matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"))
        XCTAssertTrue("email@mail.com".matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"))
    }
    
    func test_starts_with_prefix() {
        XCTAssertTrue("Hello World!".starts(with: "hellO", caseSensitive: false))
        XCTAssertFalse("Hello World!".starts(with: "HELLo"))
    }
    
    func test_end_with_suffix() {
        XCTAssertTrue("Hello World!".ends(with: "LD!", caseSensitive: false))
        XCTAssertFalse("Hello World!".ends(with: "WorLD!"))
    }
    
    func test_slice() {
        XCTAssertEqual("12345678".slicing(from: 1, length: 2), "23")
        XCTAssertEqual("12345678".slicing(from: 2, length: 0), "")
        XCTAssertNil("12345678".slicing(from: 9, length: 1))
        XCTAssertEqual("12345678".slicing(from: 5, length: 10), "678")
        
        var str = "12345678"
        str.slice(from: 1, length: 2)
        XCTAssertEqual(str, "23")
        str = "12345678"
        str.slice(from: 2, length: 0)
        XCTAssertEqual(str, "")
        str = "12345678"
        str.slice(from: 9, length: 1)
        XCTAssertEqual(str, str)
        str = "12345678"
        str.slice(from: 5, length: 10)
        XCTAssertEqual(str, "678")
        
        str = "12345678"
        str.slice(from: 1, to: 3)
        XCTAssertEqual(str, "23")
        str = "12345678"
        str.slice(from: 2, to: 2)
        XCTAssertEqual(str, "")
        str = "12345678"
        str.slice(from: 9, to: 11)
        XCTAssertEqual(str, str)
        str = "12345678"
        str.slice(from: 5, to: 15)
        XCTAssertEqual(str, str)
        
        str = "12345678"
        str.slice(at: 5)
        XCTAssertEqual(str, "678")
        str = "12345678"
        str.slice(at: 10)
        XCTAssertEqual(str, "12345678")
    }
    
    func test_truncate() {
        XCTAssertEqual("This is a very long sentence".truncated(toLength: 14), "This is a very...")
        XCTAssertEqual("This is a very long sentence".truncated(toLength: 14, trailing: nil), "This is a very")
        XCTAssertEqual("This is a short sentence".truncated(toLength: 100), "This is a short sentence")
        
        var str = "This is a very long sentence"
        str.truncate(toLength: 14)
        XCTAssertEqual(str, "This is a very...")
        
        str = "This is a very long sentence"
        str.truncate(toLength: 14, trailing: nil)
        XCTAssertEqual(str, "This is a very")
        
        str = "This is a short sentence"
        str.truncate(toLength: 100)
        XCTAssertEqual(str, "This is a short sentence")
        
        str.truncate(toLength: -1)
        XCTAssertEqual(str, "This is a short sentence")
    }
    
    func test_remove_prefix() {
        let str = "Hello, World!"
        XCTAssertEqual(str.removePrefix("Hell"), "o, World!")
        XCTAssertEqual(str.removePrefix("hloo"), str)
    }
    
    func test_remove_suffix() {
        let str = "Hello, World!"
        XCTAssertEqual(str.removeSuffix("ld!"), "Hello, Wor")
        XCTAssertEqual(str.removeSuffix("hloo"), str)
    }
    
    func test_pad() {
        XCTAssertEqual("str".paddingStart(10), "       str")
        XCTAssertEqual("str".paddingStart(10, with: "br"), "brbrbrbstr")
        XCTAssertEqual("str".paddingStart(5, with: "brazil"), "brstr")
        XCTAssertEqual("str".paddingStart(6, with: "a"), "aaastr")
        XCTAssertEqual("str".paddingStart(6, with: "abc"), "abcstr")
        XCTAssertEqual("str".paddingStart(2), "str")
        
        var str: String = "str"
        str.padStart(10)
        XCTAssertEqual(str, "       str")
        str = "str"
        str.padStart(10, with: "br")
        XCTAssertEqual(str, "brbrbrbstr")
        str = "str"
        str.padStart(5, with: "brazil")
        XCTAssertEqual(str, "brstr")
        str = "str"
        str.padStart(6, with: "a")
        XCTAssertEqual(str, "aaastr")
        str = "str"
        str.padStart(6, with: "abc")
        XCTAssertEqual(str, "abcstr")
        str = "str"
        str.padStart(2)
        XCTAssertEqual(str, "str")
        
        XCTAssertEqual("str".paddingEnd(10), "str       ")
        XCTAssertEqual("str".paddingEnd(10, with: "br"), "strbrbrbrb")
        XCTAssertEqual("str".paddingEnd(5, with: "brazil"), "strbr")
        XCTAssertEqual("str".paddingEnd(6, with: "a"), "straaa")
        XCTAssertEqual("str".paddingEnd(6, with: "abc"), "strabc")
        XCTAssertEqual("str".paddingEnd(2), "str")
        
        str = "str"
        str.padEnd(10)
        XCTAssertEqual(str, "str       ")
        str = "str"
        str.padEnd(10, with: "br")
        XCTAssertEqual(str, "strbrbrbrb")
        str = "str"
        str.padEnd(5, with: "brazil")
        XCTAssertEqual(str, "strbr")
        str = "str"
        str.padEnd(6, with: "a")
        XCTAssertEqual(str, "straaa")
        str = "str"
        str.padEnd(6, with: "abc")
        XCTAssertEqual(str, "strabc")
        str = "str"
        str.padEnd(2)
        XCTAssertEqual(str, "str")
    }
    
    func test_operators() {
        let str = "he's"
        
        XCTAssertEqual(str * 2, "he'she's")
        XCTAssertEqual(2 * str, "he'she's")
        
        XCTAssertEqual(str * 0, "")
        XCTAssertEqual(0 * str, "")
        
        XCTAssertEqual(str * -2, "")
        XCTAssertEqual(-2 * str, "")
    }
}
