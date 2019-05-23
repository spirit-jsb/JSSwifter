//
//  UIButtonExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest

class UIButtonExtensionTest: XCTestCase {

    func test_normal_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.normalImage, button.image(for: .normal))
        let normalImage = UIImage()
        button.normalImage = normalImage
        XCTAssertEqual(button.normalImage, normalImage)
    }
    
    func test_highlighted_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.highlightedImage, button.image(for: .highlighted))
        let highlightedImage = UIImage()
        button.highlightedImage = highlightedImage
        XCTAssertEqual(button.highlightedImage, highlightedImage)
    }
    
    func test_selected_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.selectedImage, button.image(for: .selected))
        let selectedImage = UIImage()
        button.selectedImage = selectedImage
        XCTAssertEqual(button.selectedImage, selectedImage)
    }
    
    func test_disabled_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.disabledImage, button.image(for: .disabled))
        let disabledImage = UIImage()
        button.disabledImage = disabledImage
        XCTAssertEqual(button.disabledImage, disabledImage)
    }
    
    func test_normal_background_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.normalBackgroundImage, button.backgroundImage(for: .normal))
        let normalBackgroundImage = UIImage()
        button.normalBackgroundImage = normalBackgroundImage
        XCTAssertEqual(button.normalBackgroundImage, normalBackgroundImage)
    }
    
    func test_highlighted_background_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.highlightedBackgroundImage, button.backgroundImage(for: .highlighted))
        let highlightedBackgroundImage = UIImage()
        button.highlightedBackgroundImage = highlightedBackgroundImage
        XCTAssertEqual(button.highlightedBackgroundImage, highlightedBackgroundImage)
    }
    
    func test_selected_background_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.selectedBackgroundImage, button.backgroundImage(for: .selected))
        let selectedBackgroundImage = UIImage()
        button.selectedBackgroundImage = selectedBackgroundImage
        XCTAssertEqual(button.selectedBackgroundImage, selectedBackgroundImage)
    }
    
    func test_disabled_background_image() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.disabledBackgroundImage, button.backgroundImage(for: .disabled))
        let disabledBackgroundImage = UIImage()
        button.disabledBackgroundImage = disabledBackgroundImage
        XCTAssertEqual(button.disabledBackgroundImage, disabledBackgroundImage)
    }
    
    func test_normal_title() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.normalTitle, button.title(for: .normal))
        let normalTitle = "Normal"
        button.normalTitle = normalTitle
        XCTAssertEqual(button.normalTitle, normalTitle)
    }
    
    func test_highlighted_title() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.highlightedTitle, button.title(for: .highlighted))
        let highlightedTitle = "Highlighted"
        button.highlightedTitle = highlightedTitle
        XCTAssertEqual(button.highlightedTitle, highlightedTitle)
    }
    
    func test_selected_title() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.selectedTitle, button.title(for: .selected))
        let selectedTitle = "Selected"
        button.selectedTitle = selectedTitle
        XCTAssertEqual(button.selectedTitle, selectedTitle)
    }
    
    func test_disabled_title() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.disabledTitle, button.title(for: .disabled))
        let disabledTitle = "Disabled"
        button.disabledTitle = disabledTitle
        XCTAssertEqual(button.disabledTitle, disabledTitle)
    }
    
    func test_normal_title_color() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.normalTitleColor, button.titleColor(for: .normal))
        let normalTitleColor = UIColor.red
        button.normalTitleColor = normalTitleColor
        XCTAssertEqual(button.normalTitleColor, normalTitleColor)
    }
    
    func test_highlighted_title_color() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.highlightedTitleColor, button.titleColor(for: .highlighted))
        let highlightedTitleColor = UIColor.yellow
        button.highlightedTitleColor = highlightedTitleColor
        XCTAssertEqual(button.highlightedTitleColor, highlightedTitleColor)
    }
    
    func test_selected_title_color() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.selectedTitleColor, button.titleColor(for: .selected))
        let selectedTitleColor = UIColor.blue
        button.selectedTitleColor = selectedTitleColor
        XCTAssertEqual(button.selectedTitleColor, selectedTitleColor)
    }
    
    func test_disabled_title_color() {
        let button = UIButton(type: .custom)
        XCTAssertEqual(button.disabledTitleColor, button.titleColor(for: .disabled))
        let disabledTitleColor = UIColor.green
        button.disabledTitleColor = disabledTitleColor
        XCTAssertEqual(button.disabledTitleColor, disabledTitleColor)
    }
    
    func test_set_image() {
        let button = UIButton(type: .custom)
        let image = UIImage()
        button.setImage(image)
        
        XCTAssertEqual(button.normalImage, image)
        XCTAssertEqual(button.highlightedImage, image)
        XCTAssertEqual(button.selectedImage, image)
        XCTAssertEqual(button.disabledImage, image)
    }
    
    func test_set_background_image() {
        let button = UIButton(type: .custom)
        let backgroundImage = UIImage()
        button.setBackgroundImage(backgroundImage)
        
        XCTAssertEqual(button.normalBackgroundImage, backgroundImage)
        XCTAssertEqual(button.highlightedBackgroundImage, backgroundImage)
        XCTAssertEqual(button.selectedBackgroundImage, backgroundImage)
        XCTAssertEqual(button.disabledBackgroundImage, backgroundImage)
    }
    
    func test_set_title() {
        let button = UIButton(type: .custom)
        let title = "Test"
        button.setTitle(title)
        
        XCTAssertEqual(button.normalTitle, title)
        XCTAssertEqual(button.highlightedTitle, title)
        XCTAssertEqual(button.selectedTitle, title)
        XCTAssertEqual(button.disabledTitle, title)
    }
    
    func test_set_title_color() {
        let button1 = UIButton(type: .custom)
        let titleColor1 = UIColor.black
        button1.setTitleColor(titleColor1)
        
        XCTAssertEqual(button1.normalTitleColor, titleColor1)
        XCTAssertEqual(button1.highlightedTitleColor, titleColor1)
        XCTAssertEqual(button1.selectedTitleColor, titleColor1)
        XCTAssertEqual(button1.disabledTitleColor, titleColor1)
        
        let button2 = UIButton(type: .custom)
        let titleColor2 = UIColor.red
        button2.setTitleColor(titleColor2, for: [.normal, .disabled])
        button2.setTitleColor(UIColor.white, for: [.highlighted, .selected])
        
        XCTAssertEqual(button2.normalTitleColor, titleColor2)
        XCTAssertEqual(button2.highlightedTitleColor, UIColor.white)
        XCTAssertEqual(button2.selectedTitleColor, UIColor.white)
        XCTAssertEqual(button2.disabledTitleColor, titleColor2)
    }
}
