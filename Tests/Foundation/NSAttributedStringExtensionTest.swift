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
    
    func test_applying_attributes_to_ranges_matching() {
        let email = "max.jian@baokuchina.com"
        let testString = NSAttributedString(string: "Your Email is \(email)").bolded
        let attributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue, .foregroundColor: UIColor.blue]
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let attrTestString = testString.applying(attributes: attributes, toRangesMatching: pattern)
        
        let attrAtBeginning = attrTestString.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attrAtBeginning.count, 1)
        
        var passed = false
        attrTestString.enumerateAttributes(in: NSRange(0..<attrTestString.length), options: .longestEffectiveRangeNotRequired) { (attrs, range, _) in
            // exit if there are not more attributes for the subsequence than what was there originally
            guard attrs.count > attrAtBeginning.count else { return }
            
            let emailFromRange = attrTestString.attributedSubstring(from: range).string
            // confirm that the string with the applied attributes is the email
            XCTAssertEqual(emailFromRange, email)
            // the range contains the email, check to make sure the attributes are there and correct
            for attr in attrs {
                switch attr.key {
                case .underlineStyle:
                    XCTAssertEqual(attr.value as? NSUnderlineStyle.RawValue, NSUnderlineStyle.single.rawValue)
                    passed = true
                case .foregroundColor:
                    XCTAssertEqual(attr.value as? UIColor, UIColor.blue)
                    passed = true
                case .font:
                    XCTAssertEqual(attr.value as? UIFont, UIFont.boldSystemFont(ofSize: UIFont.systemFontSize))
                    passed = true
                default:
                    passed = false
                }
            }
            XCTAssertTrue(passed)
        }
    }
    
    func test_applying_attributes_to_occurrences() {
        let name = "Max Jian"
        let greeting = "Hello, \(name)."
        let attrGreeting = NSAttributedString(string: greeting).italicized.strikethrough.applying(
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                         .foregroundColor: UIColor.black], toOccurrencesOf: name)
        
        let attrAtBeginning = attrGreeting.attributes(at: 0, effectiveRange: nil)
        XCTAssertEqual(attrAtBeginning.count, 2)
        
        var passed = false
        attrGreeting.enumerateAttributes(in: NSRange(0..<attrGreeting.length), options: .longestEffectiveRangeNotRequired) { (attrs, range, _) in
            // exit if there are not more attributes for the subsequence than what was there originally
            guard attrs.count > attrAtBeginning.count else { return }
            
            let stringAtRange = attrGreeting.attributedSubstring(from: range).string
            // confirm that the string with the applied attributes is the name
            XCTAssertEqual(stringAtRange, name)
            // the range contains the name, check to make sure the attributes are there and correct
            for attr in attrs {
                switch attr.key {
                case .underlineStyle:
                    XCTAssertEqual(attr.value as? NSUnderlineStyle.RawValue, NSUnderlineStyle.single.rawValue)
                    passed = true
                case .foregroundColor:
                    XCTAssertEqual(attr.value as? UIColor, UIColor.black)
                    passed = true
                case .font:
                    XCTAssertEqual(attr.value as? UIFont, UIFont.italicSystemFont(ofSize: UIFont.systemFontSize))
                    passed = true
                case .strikethroughStyle:
                    XCTAssertEqual(attr.value as? NSUnderlineStyle.RawValue, NSUnderlineStyle.single.rawValue)
                    passed = true
                default:
                    passed = false
                }
            }
            XCTAssertTrue(passed)
        }
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
