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
    
    /// CollectionView 上最后一项的 IndexPath
    var indexPathForLastItem: IndexPath? {
        return self.indexPathForLastItem(inSection: self.lastSection)
    }
    
    /// CollectionView 上最后一项的 Section
    var lastSection: Int {
        return self.numberOfSections > 0 ? self.numberOfSections - 1 : 0
    }
    
    // MARK:
    
    /// CollectionView 上所有 Section 的总项数
    ///
    /// - Returns: 返回 CollectionView 上的总项数
    func numberOfItems() -> Int {
        var section = 0
        var itemsCount = 0
        while section < self.numberOfSections {
            itemsCount += self.numberOfItems(inSection: section)
            section += 1
        }
        return itemsCount
    }
    
    /// CollectionView 上给定的 Section 中最后一项的 IndexPath
    ///
    /// - Parameter section: 给定的 Section
    /// - Returns: 返回给定的 Section 中最后一项的 IndexPath
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
    
    /// 重新加载数据
    ///
    /// - Parameter completionHandler: 重新加载数据后的处理闭包
    func reloadData(_ completionHandler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.0, animations: {
            self.reloadData()
        }, completion: { (_) in
            completionHandler()
        })
    }
    
    /// 检查给定的 IndexPath 在指定的 CollectionView 中是否有效
    ///
    /// - Parameter indexPath: 用于检查的给定 IndexPath
    /// - Returns: 返回检查给定的 IndexPath 在指定的 CollectionView 中是否有效
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.item < self.numberOfItems(inSection: indexPath.section)
    }
    
    /// 将指定的 CollectionView 安全的滚动至指定的 IndexPath
    ///
    /// - Parameters:
    ///   - indexPath: 滚动至指定的 IndexPath
    ///   - scrollPosition: 滚动位置
    ///   - animated: 是否展示滚动动画
    func safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        guard indexPath.section < self.numberOfSections else { return }
        guard indexPath.item < self.numberOfItems(inSection: indexPath.section) else { return }
        self.scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    /// 使用 UICollectionViewCell 的子类注册 UICollectionViewCell
    ///
    /// - Parameter cellClass: 在 collectionView 视图上使用的 cell 视图的类，该类必须为 UICollectionViewCell 的子类
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forCellWithReuseIdentifier: reusable.identifier)
    }
    
    /// 使用 UICollectionReusableView 的子类注册 UICollectionReusableView
    ///
    /// - Parameters:
    ///   - kind: 需注册视图的类型(.elementKindSectionHeader || .elementKindSectionFooter)
    ///   - viewClass: 在 collectionView 视图上使用的 header/footer 视图的类，该类必须为 UICollectionReusableView 的子类
    func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, viewClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        guard kind == UICollectionView.elementKindSectionHeader || kind == UICollectionView.elementKindSectionFooter else {
            fatalError("No Supplementary View Of Kind (\(kind))")
        }
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reusable.identifier + kind)
    }
    
    /// 移除可重用的 UICollectionViewCell
    ///
    /// - Parameter indexPath: 指定 cell 的 IndexPath
    /// - Returns: 返回具有指定 identifier 的 cell 视图，如果重用队列中不存在此类对象则抛出异常
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reusable = ReusableIdentifier<T>()
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: reusable.identifier, for: indexPath) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return cell
    }
    
    /// 移除可重用的 UICollectionReusableView
    ///
    /// - Parameters:
    ///   - kind: 移除视图的类型(.elementKindSectionHeader || .elementKindSectionFooter)
    ///   - indexPath: 指定 header || footer 的 IndexPath
    /// - Returns: 返回具有指定 identifier 的 reusableView 视图，如果重用队列中不存在此类对象则抛出异常
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
