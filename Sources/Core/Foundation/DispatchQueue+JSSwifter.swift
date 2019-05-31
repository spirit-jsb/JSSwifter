//
//  DispatchQueue+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/13.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    // MARK:
    
    /// 指定 DispatchQueue 是否为主线程
    ///
    ///     let group = DispatchGroup()
    ///     DispatchQueue.main.async(group: group, execute: {
    ///         // DispatchQueue.isMainQueue, true
    ///     })
    ///     DispatchQueue.global().async(group: group, execute: {
    ///         // DispatchQueue.isMainQueue, false
    ///     })
    ///
    static var isMainQueue: Bool {
        enum Static {
            static var key: DispatchSpecificKey<Void> = {
                let key = DispatchSpecificKey<Void>()
                DispatchQueue.main.setSpecific(key: key, value: ())
                return key
            }()
        }
        return DispatchQueue.getSpecific(key: Static.key) != nil
    }
    
    // MARK:
    private static var onceTracker: [String] = [String]()
    
    // MARK:
    
    /// 构建单例对象
    ///
    ///     let once_token = "test_once_token"
    ///     let other_token = "test_other_token"
    ///     let once = "once"
    ///     let other = "other"
    ///
    ///     var test: String = ""
    ///
    ///     DispatchQueue.once(token: once_token, completionHandler: {
    ///         test = once
    ///     })
    ///     // test == once, true
    ///     DispatchQueue.once(token: once_token, completionHandler: {
    ///         test = other
    ///     })
    ///     // test == other, false
    ///     DispatchQueue.once(token: other_token, completionHandler: {
    ///         test = other
    ///     })
    ///     // test == other, true
    ///
    static func once(token: String, completionHandler: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if self.onceTracker.contains(token) {
            return
        }
        self.onceTracker.append(token)
        completionHandler()
    }
    
    /// 给定 DispatchQueue 是否为指定队列
    ///
    ///     let group = DispatchGroup()
    ///     let queue = DispatchQueue.global()
    ///     queue.async(group: group, execute: {
    ///         // DispatchQueue.isCurrent(queue), true
    ///     })
    ///     DispatchQueue.main.async(group: group, execute: {
    ///         // DispatchQueue.isCurrent(queue), false
    ///     })
    ///
    /// - Parameter queue: 用于比较的 DispatchQueue 实例
    /// - Returns: 返回给定 DispatchQueue 与当前队列的比较结果
    static func isCurrent(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        queue.setSpecific(key: key, value: ())
        defer {
            queue.setSpecific(key: key, value: nil)
        }
        return DispatchQueue.getSpecific(key: key) != nil
    }
}
