//
//  UIStackViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIStackViewExtensionTest: XCTestCase {

    func test_init_with_views() {
        let view1 = UIView()
        let view2 = UIView()
        var stack = UIStackView(arrangedSubviews: [view1, view2], axis: .horizontal)
        
        XCTAssertEqual(stack.arrangedSubviews.count, 2)
        XCTAssertTrue(stack.arrangedSubviews[0] === view1)
        XCTAssertTrue(stack.arrangedSubviews[1] === view2)
        
        XCTAssertEqual(stack.axis, .horizontal)
        XCTAssertEqual(stack.spacing, 0.0)
        XCTAssertEqual(stack.alignment, .fill)
        XCTAssertEqual(stack.distribution, .fill)
        
        XCTAssertEqual(UIStackView(arrangedSubviews: [view1, view2], axis: .vertical).axis, .vertical)
        XCTAssertEqual(UIStackView(arrangedSubviews: [view1, view2], axis: .vertical, spacing: 5.0).spacing, 5.0)
        XCTAssertEqual(UIStackView(arrangedSubviews: [view1, view2], axis: .vertical, spacing: 5.0, alignment: .center).alignment, .center)
        XCTAssertEqual(UIStackView(arrangedSubviews: [view1, view2], axis: .vertical, spacing: 5.0, alignment: .center, distribution: .fillEqually).distribution, .fillEqually)
        
        stack = UIStackView(arrangedSubviews: [view1, view2], axis: .vertical, spacing: 5.0, alignment: .center, distribution: .fillEqually)
        
        XCTAssertEqual(stack.axis, .vertical)
        XCTAssertEqual(stack.spacing, 5.0)
        XCTAssertEqual(stack.alignment, .center)
        XCTAssertEqual(stack.distribution, .fillEqually)
    }
    
    func test_add_arranged_subviews() {
        let view1 = UIView()
        let view2 = UIView()
        let stack = UIStackView()
        stack.addArrangedSubviews([view1, view2])
        XCTAssertEqual(stack.arrangedSubviews.count, 2)
        XCTAssertTrue(stack.arrangedSubviews[0] === view1)
        XCTAssertTrue(stack.arrangedSubviews[1] === view2)
    }
    
    func test_remove_arranged_subviews() {
        let view1 = UIView()
        let view2 = UIView()
        let stack = UIStackView()
        stack.addArrangedSubview(view1)
        stack.addArrangedSubview(view2)
        
        stack.removeArrangedSubviews()
        
        XCTAssertTrue(stack.arrangedSubviews.isEmpty)
    }
}
