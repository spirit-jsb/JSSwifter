//
//  UITableViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/15.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UITableViewExtensionTest: XCTestCase {

    func test_register() {
        let tableView = UITableView(frame: .zero, style: .plain)

        tableView.registerCell(TestTableViewCell.self)
        tableView.registerHeaderFooterView(TestTableViewHeaderFooterView.self)

        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell") as? TestTableViewCell
        let headerFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TestTableViewHeaderFooterView") as? TestTableViewHeaderFooterView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(headerFooterView)
    }
    
    func test_dequeue() {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.register(TestTableViewCell.self, forCellReuseIdentifier: "TestTableViewCell")
        tableView.register(TestTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "TestTableViewHeaderFooterView")
        
        let cell = tableView.dequeueCell() as TestTableViewCell
        let headerFooterView = tableView.dequeueHeaderFooterView() as TestTableViewHeaderFooterView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(headerFooterView)
    }
    
    func test_register_dequeue() {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.registerCell(TestTableViewCell.self)
        tableView.registerHeaderFooterView(TestTableViewHeaderFooterView.self)
        
        let cell = tableView.dequeueCell() as TestTableViewCell
        let headerFooterView = tableView.dequeueHeaderFooterView() as TestTableViewHeaderFooterView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(headerFooterView)
    }
}

private class TestTableViewCell: UITableViewCell {  }
private class TestTableViewHeaderFooterView: UITableViewHeaderFooterView {  }
