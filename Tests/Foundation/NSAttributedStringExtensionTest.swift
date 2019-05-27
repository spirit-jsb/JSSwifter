//
//  NSAttributedStringExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class NSAttributedStringExtensionTest: XCTestCase {
    
    func test_bolded() {
        let string = NSAttributedString(string: "Bolded")
        let out = string.bolded
        let attributes = out.attributes(at: 0, effectiveRange: nil)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            return (key == NSAttributedString.Key.font && (value as? UIFont) == UIFont.boldSystemFont(ofSize: UIFont.systemFontSize))
        }
        
        let filteredAttributes = attributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 1)
    }
    
    func test_italicized() {
        let string = NSAttributedString(string: "Italicized")
        let out = string.italicized
        let attributes = out.attributes(at: 0, effectiveRange: nil)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            return (key == NSAttributedString.Key.font && (value as? UIFont) == UIFont.italicSystemFont(ofSize: UIFont.systemFontSize))
        }
        
        let filteredAttributes = attributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 1)
    }
    
    func test_underlined() {
        let string = NSAttributedString(string: "Underlined")
        let out = string.underlined
        let attributes = out.attributes(at: 0, effectiveRange: nil)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            return (key == NSAttributedString.Key.underlineStyle && (value as? NSUnderlineStyle.RawValue) == NSUnderlineStyle.single.rawValue)
        }
        
        let filteredAttributes = attributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 1)
    }
    
    func test_strikethrough() {
        let string = NSAttributedString(string: "Strikethrough")
        let out = string.strikethrough
        let attributes = out.attributes(at: 0, effectiveRange: nil)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            return (key == NSAttributedString.Key.strikethroughStyle && (value as? NSUnderlineStyle.RawValue) == NSUnderlineStyle.single.rawValue)
        }
        
        let filteredAttributes = attributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 1)
    }
    
    func test_attributes() {
        let emptyString = NSAttributedString(string: "").bolded.strikethrough.underlined.colored(with: UIColor.black)
        let emptyStringAttributes = emptyString.attributes
        XCTAssertTrue(emptyStringAttributes.isEmpty)
        
        let string = NSAttributedString(string: "Test").bolded.strikethrough.underlined.colored(with: UIColor.black)
        let stringAttributes = string.attributes
        XCTAssertEqual(stringAttributes.count, 4)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            switch key {
            case NSAttributedString.Key.strikethroughStyle:
                return (value as? NSUnderlineStyle.RawValue) == NSUnderlineStyle.single.rawValue
            case NSAttributedString.Key.underlineStyle:
                return (value as? NSUnderlineStyle.RawValue) == NSUnderlineStyle.single.rawValue
            case NSAttributedString.Key.font:
                return (value as? UIFont) == UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
            case NSAttributedString.Key.foregroundColor:
                return (value as? UIColor) == .black
            default:
                return false
            }
        }
        
        let filteredAttributes = stringAttributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 4)
    }
    
    func test_colored() {
        let string = NSAttributedString(string: "Colored")
        var out = string.colored(with: UIColor.red)
        var attributes = out.attributes(at: 0, effectiveRange: nil)
        
        let filterClosure: (NSAttributedString.Key, Any) -> Bool = { (key, value) in
            return key == NSAttributedString.Key.foregroundColor && (value as? UIColor) == UIColor.red
        }
        
        let filteredAttributes = attributes.filter { filterClosure($0, $1) }
        XCTAssertEqual(filteredAttributes.count, 1)
        
        out = out.colored(with: UIColor.blue)
        attributes = out.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.blue)
        XCTAssertNotEqual(attributes[NSAttributedString.Key.foregroundColor] as? UIColor, UIColor.red)
    }
    
    func test_operators() {
        var string1 = NSAttributedString(string: "Test").italicized.underlined.strikethrough
        let string2 = NSAttributedString(string: " Appending").bolded
        XCTAssertEqual((string1 + string2).string, "Test Appending")
        XCTAssertEqual((string1 + string2.string).string, "Test Appending")
        
        string1 += string2.string
        XCTAssertEqual(string1.string, "Test Appending")
        let attributes = string1.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attributes.count, 3)
        
        string1 += string2
        XCTAssertEqual(string1.string, "Test Appending Appending")
    }
}
