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
    var indexPathForLastRow: IndexPath? {
        return self.indexPathForLastRow(inSection: self.lastSection)
    }
    
    var lastSection: Int {
        return self.numberOfSections > 0 ? self.numberOfSections - 1 : 0
    }
    
    // MARK:
    func numberOfRows() -> Int {
        var section = 0
        var rowsCount = 0
        while section < self.numberOfSections {
            rowsCount += self.numberOfRows(inSection: section)
            section += 1
        }
        return rowsCount
    }
    
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else { return nil }
        guard self.numberOfRows(inSection: section) > 0 else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: self.numberOfRows(inSection: section) - 1, section: section)
    }
    
    func reloadData(_ completionHandler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.0, animations: {
            self.reloadData()
        }, completion: { (_) in
            completionHandler()
        })
    }
    
    func removeTableHeaderView() {
        self.tableHeaderView = nil
    }
    
    func removeTableFooterView() {
        self.tableFooterView = nil
    }
    
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row > self.numberOfRows(inSection: indexPath.section)
    }
    
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < self.numberOfSections else { return }
        guard indexPath.row < self.numberOfRows(inSection: indexPath.section) else { return }
        self.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forCellReuseIdentifier: reusable.identifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(aClass: T.Type) {
        let reusable = ReusableIdentifier<T>()
        self.register(T.self, forHeaderFooterViewReuseIdentifier: reusable.identifier)
    }
    
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
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        let reusable = ReusableIdentifier<T>()
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: reusable.identifier) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return headerFooterView
    }
}
