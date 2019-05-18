//
//  UIApplication+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/18.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    enum Environment {
        case debug
        case testFlight
        case appStore
    }
    
    // MARK:
    var name: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
    
    var identifier: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String
    }
    
    var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    var build: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    var environment: Environment {
        #if DEBUG
        return .debug
        #elseif targetEnvironment(simulator)
        return .debug
        #else
        if Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }
        guard let appStoreReceiptURL = Bundle.main.appStoreReceiptURL else {
            return .debug
        }
        if appStoreReceiptURL.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }
        if appStoreReceiptURL.path.lowercased().contains("simulator") {
            return .debug
        }
        return .appStore
        #endif
    }
}
