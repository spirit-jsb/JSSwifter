//
//  UITableView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UITableView {
    
    // MARK:
    private struct ReusableIdentifier <T: UIView> {
        
        // MARK:
        let identifier: String = String(describing: T.self)
    }
    
    // MARK:
    
    /// TableView 上最后一行的 IndexPath
    var indexPathForLastRow: IndexPath? {
        return self.indexPathForLastRow(inSection: self.lastSection)
    }
    
    /// TableView 上最后一行的 Section
    var lastSection: Int {
        return self.numberOfSections > 0 ? self.numberOfSections - 1 : 0
    }
    
    // MARK:
    
    /// TableView 上所有 Section 的总行数
    ///
    /// - Returns: 返回 TableView 上的总行数
    func numberOfRows() -> Int {
        var section = 0
        var rowsCount = 0
        while section < self.numberOfSections {
            rowsCount += self.numberOfRows(inSection: section)
            section += 1
        }
        return rowsCount
    }
    
    /// TableView 上给定的 Section 中最后一行的 IndexPath
    ///
    /// - Parameter section: 给定的 Section
    /// - Returns: 返回给定的 Section 中最后一行的 IndexPath
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else { return nil }
        guard self.numberOfRows(inSection: section) > 0 else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: self.numberOfRows(inSection: section) - 1, section: section)
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
    
    /// 移除 TableHeaderView
    func removeTableHeaderView() {
        self.tableHeaderView = nil
    }
    
    /// 移除 TableFooterView
    func removeTableFooterView() {
        self.tableFooterView = nil
    }
    
    /// 检查给定的 IndexPath 在指定的 TableView 中是否有效
    ///
    /// - Parameter indexPath: 用于检查的给定 IndexPath
    /// - Returns: 返回检查给定的 IndexPath 在指定的 TableView 中是否有效
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    /// 将指定的 TableView 安全的滚动至指定的 IndexPath
    ///
    /// - Parameters:
    ///   - indexPath: 滚动至指定的 IndexPath
    ///   - scrollPosition: 滚动位置
    ///   - animated: 是否展示滚动动画
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < self.numberOfSections else { return }
        guard indexPath.row < self.numberOfRows(inSection: indexPath.section) else { return }
        self.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    /// 使用 UITableViewCell 的子类注册 UITableViewCell
    ///
    /// - Parameter cellClass: 在 tableView 视图上使用的 cell 视图的类，该类必须为 UITableViewCell 的子类
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forCellReuseIdentifier: reusable.identifier)
    }
    
    /// 使用 UITableViewHeaderFooterView 的子类注册 UITableViewHeaderFooterView
    ///
    /// - Parameter aClass: 在 tableView 视图上使用的 header/footer 视图的类，该类必须为 UITableViewHeaderFooterView 的子类
    func register<T: UITableViewHeaderFooterView>(aClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forHeaderFooterViewReuseIdentifier: reusable.identifier)
    }
    
    /// 移除可重用的 UITableViewCell
    ///
    /// - Parameter indexPath: 指定 cell 的 IndexPath，默认值为 nil
    /// - Returns: 返回具有指定 identifier 的 cell 视图，如果重用队列中不存在此类对象则抛出异常
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath? = nil) -> T {
        let reusable = ReusableIdentifier<T>()
        
        guard let cell = indexPath != nil ?
            self.dequeueReusableCell(withIdentifier: reusable.identifier, for: indexPath!) as? T :
            self.dequeueReusableCell(withIdentifier: reusable.identifier) as? T else
        {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }

        return cell
    }
    
    /// 移除可重用的 UITableViewHeaderFooterView
    ///
    /// - Returns: 返回具有指定 identifier 的 headerFooterView 视图，如果重用队列中不存在此类对象则抛出异常
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        let reusable = ReusableIdentifier<T>()
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: reusable.identifier) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return headerFooterView
    }
}
