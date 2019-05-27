//
//  UIFontExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/27.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIFontExtensionTest: XCTestCase {
    
    func test_is_bold() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let boldFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0.0)
        XCTAssertTrue(boldFont.isBold)
        let normalFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([])!, size: 0.0)
        XCTAssertFalse(normalFont.isBold)
    }
    
    func test_is_italic() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let italicFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits(.traitItalic)!, size: 0.0)
        XCTAssertTrue(italicFont.isItalic)
        let normalFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([])!, size: 0.0)
        XCTAssertFalse(normalFont.isItalic)
    }
    
    func test_is_bold_italic() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let italicFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([.traitBold, .traitItalic])!, size: 0.0)
        XCTAssertTrue(italicFont.isBoldItalic)
        let normalFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([])!, size: 0.0)
        XCTAssertFalse(normalFont.isBoldItalic)
    }
    
    func test_is_mono_space() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                         UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
        let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
        let descriptor = font.fontDescriptor.addingAttributes(attributes)
        let monoFont = UIFont(descriptor: descriptor, size: 0.0)
        XCTAssertTrue(monoFont.isMonoSpace)
        let normalFont = UIFont(descriptor: font.fontDescriptor.withSymbolicTraits([])!, size: 0.0)
        XCTAssertFalse(normalFont.isMonoSpace)
    }
    
    func test_bold() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let boldFont = font.bold
        XCTAssertTrue(boldFont.fontDescriptor.symbolicTraits.contains(.traitBold))
    }
    
    func test_italic() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let italicFont = font.italic
        XCTAssertTrue(italicFont.fontDescriptor.symbolicTraits.contains(.traitItalic))
    }
    
    func test_bold_italic() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let boldItalicFont = font.boldItalic
        XCTAssertTrue(boldItalicFont.fontDescriptor.symbolicTraits.contains([.traitBold, .traitItalic]))
    }
    
    func test_monospaced() {
        let font = UIFont.preferredFont(forTextStyle: .body)
        let monospacedFont = font.monospaced
        
        let attributes = monospacedFont.fontDescriptor.fontAttributes
        let fontKey: UIFontDescriptor.AttributeName = UIFontDescriptor.AttributeName.featureSettings
        guard let settings = attributes[fontKey] as? [[UIFontDescriptor.AttributeName: Int]] else {
            XCTFail("Unable to get settings from font")
            return
        }
        guard let selector = settings.first?[UIFontDescriptor.AttributeName(rawValue: "CTFeatureSelectorIdentifier")] else {
            XCTFail("Unable to get selector from font")
            return
        }
        guard let space = settings.first?[UIFontDescriptor.AttributeName(rawValue: "CTFeatureTypeIdentifier")] else {
            XCTFail("Unable to get space from font")
            return
        }
        XCTAssertEqual(selector, kMonospacedNumbersSelector)
        XCTAssertEqual(space, kNumberSpacingType)
        XCTAssertEqual(font.fontName, monospacedFont.fontName)
        XCTAssertEqual(font.familyName, monospacedFont.familyName)
        XCTAssertEqual(font.lineHeight, monospacedFont.lineHeight)
    }
}
