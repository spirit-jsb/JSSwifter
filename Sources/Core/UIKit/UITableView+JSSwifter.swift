//
//  UITableView+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension UITableView {
    
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
    func registerCell<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: ReusableIdentifier<T>().identifier)
    }
    
    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: ReusableIdentifier<T>().identifier)
    }
    
    func dequeueCell<T: UITableViewCell>(indexPath: IndexPath? = nil) -> T {
        let reusable = ReusableIdentifier<T>()
        
        guard let cell = indexPath != nil ?
            self.dequeueReusableCell(withIdentifier: reusable.identifier, for: indexPath!) as? T :
            self.dequeueReusableCell(withIdentifier: reusable.identifier) as? T else
        {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }

        return cell
    }
    
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        let reusable = ReusableIdentifier<T>()
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: reusable.identifier) as? T else {
            fatalError("No identifier(\(reusable.identifier)) found for \(T.self)")
        }
        return headerFooterView
    }
}
