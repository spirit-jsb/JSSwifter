//
//  FileManagerExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/18.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class FileManagerExtensionTest: XCTestCase {
    
    func test_document() {
        let path = FileManager.default.documentPath
        let url = FileManager.default.documentURL
        
        XCTAssertNotNil(path)
        XCTAssertNotNil(url)
        
        XCTAssertTrue(path!.contains("Document"))
        XCTAssertTrue(url!.lastPathComponent.contains("Document"))
    }
    
    func test_library() {
        let path = FileManager.default.libraryPath
        let url = FileManager.default.libraryURL
        
        XCTAssertNotNil(path)
        XCTAssertNotNil(url)
        
        XCTAssertTrue(path!.contains("Library"))
        XCTAssertTrue(url!.lastPathComponent.contains("Library"))
    }
    
    func test_caches() {
        let path = FileManager.default.cachesPath
        let url = FileManager.default.cachesURL
        
        XCTAssertNotNil(path)
        XCTAssertNotNil(url)
        
        XCTAssertTrue(path!.contains("Caches"))
        XCTAssertTrue(url!.lastPathComponent.contains("Caches"))
    }
}
