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
    
    func test_register_dequeue() {
        let indexPath = IndexPath(item: 0, section: 0)
        
        self.collectionView.register(TestCollectionViewCell.self)
        self.collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionHeader, TestCollectionReusableView.self)
        self.collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionFooter, TestCollectionReusableView.self)
        
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
