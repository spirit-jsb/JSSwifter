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
    
    static func isCurrent(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        queue.setSpecific(key: key, value: ())
        defer {
            queue.setSpecific(key: key, value: nil)
        }
        return DispatchQueue.getSpecific(key: key) != nil
    }
}
