//
//  UIScrollViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UIScrollViewExtensionTest: XCTestCase {

    func test_snapshot() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0))
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        XCTAssertNotNil(scroll.snapshot)
        let emptyScroll = UIScrollView()
        XCTAssertNil(emptyScroll.snapshot)
    }
    
    func test_scroll_to_top() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0))
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        scroll.contentInset = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
        scroll.scrollToTop()
        XCTAssertEqual(scroll.contentOffset, CGPoint(x: 0.0, y: -100.0))
    }
    
    func test_scroll_to_bottom() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0))
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        scroll.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 100.0, right: 0.0)
        scroll.scrollToBottom()
        XCTAssertEqual(scroll.contentOffset, CGPoint(x: 0.0, y: 100.0))
    }
    
    func test_scroll_to_left() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0))
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        scroll.contentInset = UIEdgeInsets(top: 0.0, left: 100.0, bottom: 0.0, right: 0.0)
        scroll.scrollToLeft()
        XCTAssertEqual(scroll.contentOffset, CGPoint(x: -100.0, y: 0.0))
    }
    
    func test_scroll_to_right() {
        let frame = CGRect(origin: .zero, size: CGSize(width: 100.0, height: 100.0))
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        scroll.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 100.0)
        scroll.scrollToRight()
        XCTAssertEqual(scroll.contentOffset, CGPoint(x: 100.0, y: 0.0))
    }
}
