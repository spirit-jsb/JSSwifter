//
//  DispatchQueueExtensionTest.swift
//  JSSwifter-Test
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class DispatchQueueExtensionTest: XCTestCase {
    
    func test_once() {
        let expect = expectation(description: "once")
        let once_token = "test_once_token"
        let other_token = "test_other_token"
        let once = "once"
        let other = "other"
        
        var test: String = ""
        
        DispatchQueue.once(token: once_token, completionHandler: {
            test = once
        })
        XCTAssertTrue(test == once)
        DispatchQueue.once(token: once_token, completionHandler: {
            test = other
        })
        XCTAssertFalse(test == other)
        DispatchQueue.once(token: other_token, completionHandler: {
            test = other
        })
        XCTAssertTrue(test == other)
        
        expect.fulfill()
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }

    func test_is_main_queue() {
        let expect = expectation(description: "isMainQueue")
        let group = DispatchGroup()
        
        DispatchQueue.main.async(group: group, execute: {
            XCTAssertTrue(DispatchQueue.isMainQueue)
        })
        DispatchQueue.global().async(group: group, execute: {
            XCTAssertFalse(DispatchQueue.isMainQueue)
        })
        
        group.notify(queue: .main, execute: {
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func test_is_current() {
        let expect = expectation(description: "isCurrent")
        let group = DispatchGroup()
        let queue = DispatchQueue.global()
        
        queue.async(group: group, execute: {
            XCTAssertTrue(DispatchQueue.isCurrent(queue))
        })
        DispatchQueue.main.async(group: group, execute: {
            XCTAssertFalse(DispatchQueue.isCurrent(queue))
        })
        
        group.notify(queue: .main, execute: {
            expect.fulfill()
        })
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
