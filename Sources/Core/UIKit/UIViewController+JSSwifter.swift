//
//  UIViewController+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    // MARK:
    
    /// 检查指定 ViewController 是否展示在屏幕上且未被隐藏
    var isVisible: Bool {
        // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
        return self.isViewLoaded && self.view.window != nil
    }
    
    /// 向指定 ViewController 中添加 Notification Observer
    ///
    /// - Parameters:
    ///   - name: Notification Observer 注册的名称，只有具有该名称的 Notification 会被 Observer 接收
    ///   - selector: 指定 Notification Post 后，Observer 接收信息的方法，该方法需有且只有一个参数( Notification 实例对象)
    func addNotificationObserver(name: Notification.Name?, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    /// 从指定 ViewController 中移除 Notification Observer
    ///
    /// - Parameter name: Notification Observer 注册的名称，只有具有该名称的 Notification Observer 会被移除
    func removeNotificationObserver(name: Notification.Name?) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    /// 从指定 ViewController 中移除所有的 Notification Observer
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
