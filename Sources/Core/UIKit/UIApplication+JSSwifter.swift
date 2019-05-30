//
//  UIApplication+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/18.
//  Copyright © 2019 Max. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    /// Application 运行环境
    ///
    /// - debug: Application 在 debug 环境下运行
    /// - testFlight: Application 在 Test Flight 环境下运行
    /// - appStore: Application 在 App Store 环境下运行
    enum Environment {
        case debug
        case testFlight
        case appStore
    }
    
    // MARK:
    
    /// Application name, (Info.plist-Bundle name)
    var name: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
    
    /// Application identifier, (Info.plist-Bundle identifier)
    var identifier: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String
    }
    
    /// Application displayName, (Info.plist-Bundle display name)
    var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    /// Application version, (Info.plist-Bundle versions string, short)
    var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// Application build, (Info.plist-Bundle version)
    var build: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    /// Application 运行环境
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
