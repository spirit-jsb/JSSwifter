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
        let identifier: String
        
        // MARK:
        init() {
            self.identifier = String(describing: T.self)
        }
    }
    
    // MARK:
    func registerCell<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: ReusableIdentifier<T>().identifier)
    }
    
    func registerReusableView<T: UICollectionReusableView>(kind: String, _: T.Type) {
        let reusable = ReusableIdentifier<T>()
        guard kind == UICollectionView.elementKindSectionHeader || kind == UICollectionView.elementKindSectionFooter else {
            fatalError("No Supplementary View Of Kind (\(kind))")
        }
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusable.identifier + kind)
    }
    
    func dequeueCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
        let reusable = ReusableIdentifier<T>()
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: reusable.identifier, for: indexPath) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(kind: String, indexPath: IndexPath) -> T {
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
