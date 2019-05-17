//
//  UICollectionView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    // MARK:
    private struct ReusableIdentifier <T: UIView> {
        
        // MARK:
        let identifier: String = String(describing: T.self)
    }
    
    // MARK:
    var indexPathForLastItem: IndexPath? {
        return self.indexPathForLastItem(inSection: self.lastSection)
    }
    
    var lastSection: Int {
        return self.numberOfSections > 0 ? self.numberOfSections - 1 : 0
    }
    
    // MARK:
    func numberOfItems() -> Int {
        var section = 0
        var itemsCount = 0
        while section < self.numberOfSections {
            itemsCount += self.numberOfItems(inSection: section)
            section += 1
        }
        return itemsCount
    }
    
    func indexPathForLastItem(inSection section: Int) -> IndexPath? {
        guard section >= 0 else {
            return nil
        }
        guard section < self.numberOfSections else {
            return nil
        }
        guard self.numberOfItems(inSection: section) > 0 else {
            return IndexPath.init(item: 0, section: section)
        }
        return IndexPath.init(item: self.numberOfItems(inSection: section) - 1, section: section)
    }
    
    func reloadData(_ completionHandler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.0, animations: {
            self.reloadData()
        }, completion: { (_) in
            completionHandler()
        })
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forCellWithReuseIdentifier: reusable.identifier)
    }
    
    func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, _: T.Type) {
        let reusable = ReusableIdentifier<T>()
        guard kind == UICollectionView.elementKindSectionHeader || kind == UICollectionView.elementKindSectionFooter else {
            fatalError("No Supplementary View Of Kind (\(kind))")
        }
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusable.identifier + kind)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reusable = ReusableIdentifier<T>()
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: reusable.identifier, for: indexPath) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofkind kind: String, for indexPath: IndexPath) -> T {
        let reusable = ReusableIdentifier<T>()
        guard kind == UICollectionView.elementKindSectionHeader || kind == UICollectionView.elementKindSectionFooter else {
            fatalError("No Supplementary View Of Kind (\(kind))")
        }
        guard let supplementary = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusable.identifier + kind, for: indexPath) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return supplementary
    }
}
