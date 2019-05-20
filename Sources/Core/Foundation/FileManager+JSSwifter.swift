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
    var documentPath: String? {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }
    
    var documentURL: URL? {
        return self.urls(for: .documentDirectory, in: .userDomainMask).last
    }
    
    var libraryPath: String? {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
    }
    
    var libraryURL: URL? {
        return self.urls(for: .libraryDirectory, in: .userDomainMask).last
    }
    
    var cachesPath: String? {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
    }
    
    var cachesURL: URL? {
        return self.urls(for: .cachesDirectory, in: .userDomainMask).last
    }
}
