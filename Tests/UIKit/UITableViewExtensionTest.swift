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
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let emptyTableView = UITableView(frame: .zero, style: .plain)

    override func setUp() {
        super.setUp()
        
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        self.emptyTableView.dataSource = self
        self.emptyTableView.reloadData()
    }
    
    func test_index_path_for_last_row() {
        XCTAssertEqual(self.tableView.indexPathForLastRow, IndexPath(row: 7, section: 1))
    }
    
    func test_last_section() {
        XCTAssertEqual(self.tableView.lastSection, 1)
        XCTAssertEqual(self.emptyTableView.lastSection, 0)
    }
    
    func test_number_of_rows() {
        XCTAssertEqual(self.tableView.numberOfRows(), 13)
        XCTAssertEqual(self.emptyTableView.numberOfRows(), 0)
    }
    
    func test_index_path_for_last_row_in_section() {
        XCTAssertNil(self.tableView.indexPathForLastRow(inSection: -1))
        XCTAssertEqual(self.tableView.indexPathForLastRow(inSection: 0), IndexPath(row: 4, section: 0))
        XCTAssertEqual(UITableView().indexPathForLastRow(inSection: 0), IndexPath(row: 0, section: 0))
    }
    
    func test_reload_data() {
        var completionCalled = false
        self.tableView.reloadData {
            completionCalled = true
            XCTAssertTrue(completionCalled)
        }
    }
    
    func test_remove_table_header_view() {
        self.tableView.tableHeaderView = UIView()
        XCTAssertNotNil(self.tableView.tableHeaderView)
        self.tableView.removeTableHeaderView()
        XCTAssertNil(self.tableView.tableHeaderView)
    }
    
    func test_remove_table_footer_view() {
        self.tableView.tableFooterView = UIView()
        XCTAssertNotNil(self.tableView.tableFooterView)
        self.tableView.removeTableFooterView()
        XCTAssertNil(self.tableView.tableFooterView)
    }
    
    func test_is_valid_index_path() {
        let validIndexPath = IndexPath(row: 0, section: 0)
        XCTAssertTrue(self.tableView.isValidIndexPath(validIndexPath))
        let invalidIndexPath = IndexPath(row: 10, section: 0)
        XCTAssertFalse(self.tableView.isValidIndexPath(invalidIndexPath))
    }
    
    func test_safe_scroll_to_index_path() {
        let validIndexPathTop = IndexPath(row: 0, section: 0)
        
        self.tableView.contentOffset = CGPoint(x: 0.0, y: 100.0)
        XCTAssertNotEqual(self.tableView.contentOffset, .zero)
        
        self.tableView.safeScrollToRow(at: validIndexPathTop, at: .top, animated: false)
        XCTAssertEqual(self.tableView.contentOffset, .zero)
        
        let validIndexPathBottom = IndexPath(row: 7, section: 1)
        let bottomOffset = CGPoint(x: 0.0, y: self.tableView.contentSize.height - self.tableView.bounds.size.height)
        
        self.tableView.contentOffset = CGPoint(x: 0.0, y: 200.0)
        XCTAssertNotEqual(self.tableView.contentOffset, bottomOffset)
        
        self.tableView.safeScrollToRow(at: validIndexPathBottom, at: .bottom, animated: false)
        XCTAssertEqual(bottomOffset.y, self.tableView.contentOffset.y, accuracy: 2.0)
        
        let invalidIndexPath = IndexPath(row: 23, section: 21)
        self.tableView.contentOffset = .zero
        
        tableView.safeScrollToRow(at: invalidIndexPath, at: .bottom, animated: false)
        XCTAssertEqual(self.tableView.contentOffset, .zero)
    }

    func test_register_dequeue() {
        self.tableView.register(cellClass: TestTableViewCell.self)
        self.tableView.register(aClass: TestTableViewHeaderFooterView.self)
        
        let cell = tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0)) as TestTableViewCell
        let headerFooterView = tableView.dequeueReusableHeaderFooterView() as TestTableViewHeaderFooterView
        
        XCTAssertNotNil(cell)
        XCTAssertNotNil(headerFooterView)
    }
}

extension UITableViewExtensionTest: UITableViewDataSource {
    
    @available(iOS 2.0, *)
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == self.tableView ? 2 :0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == self.tableView ? (section == 0 ? 5 : 8) : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

private class TestTableViewCell: UITableViewCell {  }
private class TestTableViewHeaderFooterView: UITableViewHeaderFooterView {  }
