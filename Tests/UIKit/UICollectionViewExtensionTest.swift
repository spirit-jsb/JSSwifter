//
//  UICollectionViewExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/15.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class UICollectionViewExtensionTest: XCTestCase {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let emptyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func setUp() {
        super.setUp()
        
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
        self.emptyCollectionView.dataSource = self
        self.emptyCollectionView.reloadData()
    }
    
    func test_index_path_for_last_item() {
        XCTAssertEqual(self.collectionView.indexPathForLastItem, IndexPath(item: 0, section: 1))
    }
    
    func test_last_section() {
        XCTAssertEqual(self.collectionView.lastSection, 1)
        XCTAssertEqual(self.emptyCollectionView.lastSection, 0)
    }
    
    func test_number_of_items() {
        XCTAssertEqual(self.collectionView.numberOfItems(), 5)
        XCTAssertEqual(self.emptyCollectionView.numberOfItems(), 0)
    }
    
    func test_index_path_for_last_item_in_section() {
        XCTAssertNil(self.collectionView.indexPathForLastItem(inSection: -1))
        XCTAssertNil(self.collectionView.indexPathForLastItem(inSection: 2))
        XCTAssertEqual(self.collectionView.indexPathForLastItem(inSection: 0), IndexPath(item: 4, section: 0))
    }
    
    func test_reload_data() {
        var completionCalled = false
        self.collectionView.reloadData {
            completionCalled = true
            XCTAssertTrue(completionCalled)
        }
    }
    
    func test_is_valid_index_path() {
        let validIndexPath = IndexPath(row: 0, section: 0)
        XCTAssertTrue(self.collectionView.isValidIndexPath(validIndexPath))
        let invalidIndexPath = IndexPath(row: 10, section: 0)
        XCTAssertFalse(self.collectionView.isValidIndexPath(invalidIndexPath))
    }
    
    func test_safe_scroll_to_item_index_path() {
        let validIndexPathTop = IndexPath(row: 0, section: 0)
        
        self.collectionView.contentOffset = CGPoint(x: 0.0, y: 100.0)
        XCTAssertNotEqual(self.collectionView.contentOffset, .zero)
        
        self.collectionView.safeScrollToItem(at: validIndexPathTop, at: .top, animated: false)
        XCTAssertEqual(self.collectionView.contentOffset, .zero)
        
        let validIndexPathBottom = IndexPath(row: 3, section: 0)
        let bottomOffset = CGPoint(x: 0.0, y: self.collectionView.contentSize.height - self.collectionView.bounds.size.height)
        
        self.collectionView.contentOffset = CGPoint(x: 0.0, y: 200.0)
        XCTAssertNotEqual(self.collectionView.contentOffset, bottomOffset)
        
        self.collectionView.safeScrollToItem(at: validIndexPathBottom, at: .bottom, animated: false)
        XCTAssertEqual(bottomOffset.y, self.collectionView.contentOffset.y, accuracy: 2.0)
        
        let invalidIndexPath = IndexPath(row: 23, section: 21)
        self.collectionView.contentOffset = .zero
        
        self.collectionView.safeScrollToItem(at: invalidIndexPath, at: .bottom, animated: false)
        XCTAssertEqual(self.collectionView.contentOffset, .zero)
    }
    
    func test_register_dequeue() {
        let indexPath = IndexPath(item: 0, section: 0)
        
        self.collectionView.register(cellClass: TestCollectionViewCell.self)
        self.collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader, viewClass: TestCollectionReusableView.self)
        self.collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionFooter, viewClass: TestCollectionReusableView.self)
        
        let cell = collectionView.dequeueReusableCell(for: indexPath) as TestCollectionViewCell
        let header = collectionView.dequeueReusableSupplementaryView(ofkind: UICollectionView.elementKindSectionHeader, for: indexPath) as TestCollectionReusableView
        let footer = collectionView.dequeueReusableSupplementaryView(ofkind: UICollectionView.elementKindSectionFooter, for: indexPath) as TestCollectionReusableView
        
        XCTAssertNotNil(cell)
        XCTAssertNotNil(header)
        XCTAssertNotNil(footer)
    }
}

extension UICollectionViewExtensionTest: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (collectionView == self.collectionView) ? 2 : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionView == self.collectionView) ? (section == 0 ? 5 : 0) : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

private class TestCollectionViewCell: UICollectionViewCell {  }
private class TestCollectionReusableView: UICollectionReusableView {  }
