//
//  UIGestureRecognizerExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/22.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIGestureRecognizerExtensionTest: XCTestCase {

    func test_remove_from_view() {
        let view = UIImageView()
        let tap = UITapGestureRecognizer()
        
        XCTAssertNil(view.gestureRecognizers)
        XCTAssertNil(tap.view)
        
        view.addGestureRecognizer(tap)
        
        XCTAssertNotNil(view.gestureRecognizers)
        XCTAssertNotNil(tap.view)
        
        XCTAssertTrue(view.gestureRecognizers?.count == 1)
        XCTAssertTrue(tap.view == view)
        
        tap.removeFromView()
        XCTAssertTrue(view.gestureRecognizers?.count == 0)
        XCTAssertTrue(tap.view == nil)
    }
}
