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

    func test_register() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        
        collectionView.registerCell(TestCollectionViewCell.self)
        collectionView.registerReusableView(kind: UICollectionView.elementKindSectionHeader, TestCollectionReusableView.self)
        collectionView.registerReusableView(kind: UICollectionView.elementKindSectionFooter, TestCollectionReusableView.self)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as? TestCollectionViewCell
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TestCollectionReusableViewUICollectionElementKindSectionHeader", for: indexPath) as? TestCollectionReusableView
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TestCollectionReusableViewUICollectionElementKindSectionFooter", for: indexPath) as? TestCollectionReusableView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(header)
        XCTAssertNotNil(footer)
    }
    
    func test_dequeue() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "TestCollectionViewCell")
        collectionView.register(TestCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TestCollectionReusableViewUICollectionElementKindSectionHeader")
        collectionView.register(TestCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TestCollectionReusableViewUICollectionElementKindSectionFooter")

        let cell = collectionView.dequeueCell(indexPath: indexPath) as TestCollectionViewCell
        let header = collectionView.dequeueReusableView(kind: UICollectionView.elementKindSectionHeader, indexPath: indexPath) as TestCollectionReusableView
        let footer = collectionView.dequeueReusableView(kind: UICollectionView.elementKindSectionFooter, indexPath: indexPath) as TestCollectionReusableView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(header)
        XCTAssertNotNil(footer)
    }
    
    func test_register_dequeue() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        let indexPath = IndexPath(item: 0, section: 0)
        
        collectionView.registerCell(TestCollectionViewCell.self)
        collectionView.registerReusableView(kind: UICollectionView.elementKindSectionHeader, TestCollectionReusableView.self)
        collectionView.registerReusableView(kind: UICollectionView.elementKindSectionFooter, TestCollectionReusableView.self)
        
        let cell = collectionView.dequeueCell(indexPath: indexPath) as TestCollectionViewCell
        let header = collectionView.dequeueReusableView(kind: UICollectionView.elementKindSectionHeader, indexPath: indexPath) as TestCollectionReusableView
        let footer = collectionView.dequeueReusableView(kind: UICollectionView.elementKindSectionFooter, indexPath: indexPath) as TestCollectionReusableView
        XCTAssertNotNil(cell)
        XCTAssertNotNil(header)
        XCTAssertNotNil(footer)
    }
}

private class TestCollectionViewCell: UICollectionViewCell {  }
private class TestCollectionReusableView: UICollectionReusableView {  }
