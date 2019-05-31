//
//  FileManager+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/18.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension FileManager {
    
    // MARK:
    
    /// 返回 Documents 沙盒路径字符串
    var documentPath: String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }
    
    /// 返回 Documents 沙盒路径 URL
    var documentURL: URL? {
        return self.urls(for: .documentDirectory, in: .userDomainMask).last
    }
    
    /// 返回 Library 沙盒路径字符串
    var libraryPath: String? {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
    }
    
    /// 返回 Library 沙盒路径 URL
    var libraryURL: URL? {
        return self.urls(for: .libraryDirectory, in: .userDomainMask).last
    }
    
    /// 返回 Caches 沙盒路径字符串
    var cachesPath: String? {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    }
    
    /// 返回 Caches 沙盒路径 URL
    var cachesURL: URL? {
        return self.urls(for: .cachesDirectory, in: .userDomainMask).last
    }
}
