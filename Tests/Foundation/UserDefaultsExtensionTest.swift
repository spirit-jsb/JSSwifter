//
//  UserDefaultsExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest

class UserDefaultsExtensionTest: XCTestCase {

    func test_subscript() {
        let key = "testKey"
        UserDefaults.standard.set(true, forKey: key)
        XCTAssertNotNil(UserDefaults.standard[key])
        XCTAssertTrue(UserDefaults.standard[key] as? Bool ?? false)
        
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard[key] = false
        XCTAssertNotNil(UserDefaults.standard[key])
        XCTAssertFalse(UserDefaults.standard[key] as? Bool ?? true)
    }
    
    func test_type() {
        let key = "testKey"
        
        UserDefaults.standard.set("hello", forKey: key)
        XCTAssertNotNil(UserDefaults.standard.string(forKey: key))
        XCTAssertEqual(UserDefaults.standard.string(forKey: key), "hello")
        
        UserDefaults.standard.set([1, 2, 3], forKey: key)
        XCTAssertNotNil(UserDefaults.standard.array(forKey: key))
        XCTAssertEqual(UserDefaults.standard.array(forKey: key) as? [Int], [1, 2, 3])
        
        UserDefaults.standard.set(["key": "value"], forKey: key)
        XCTAssertNotNil(UserDefaults.standard.dictionary(forKey: key))
        XCTAssertEqual(UserDefaults.standard.dictionary(forKey: key) as? [String: String], ["key": "value"])
        
        UserDefaults.standard.set("hello".data(using: .utf8), forKey: key)
        XCTAssertNotNil(UserDefaults.standard.data(forKey: key))
        XCTAssertEqual(UserDefaults.standard.data(forKey: key)?.string(encoding: .utf8), "hello")
        
        UserDefaults.standard.set(["1", "2", "3"], forKey: key)
        XCTAssertNotNil(UserDefaults.standard.stringArray(forKey: key))
        XCTAssertEqual(UserDefaults.standard.stringArray(forKey: key), ["1", "2", "3"])
        
        UserDefaults.standard.set(Int(1), forKey: key)
        XCTAssertNotNil(UserDefaults.standard.integer(forKey: key))
        XCTAssertEqual(UserDefaults.standard.integer(forKey: key), Int(1))
        
        UserDefaults.standard.set(Float(122.0), forKey: key)
        XCTAssertNotNil(UserDefaults.standard.float(forKey: key))
        XCTAssertEqual(UserDefaults.standard.float(forKey: key), Float(122.0))
        
        UserDefaults.standard.set(Double(1.22), forKey: key)
        XCTAssertNotNil(UserDefaults.standard.double(forKey: key))
        XCTAssertEqual(UserDefaults.standard.double(forKey: key), Double(1.22))
        
        UserDefaults.standard.set(false, forKey: key)
        XCTAssertNotNil(UserDefaults.standard.bool(forKey: key))
        XCTAssertEqual(UserDefaults.standard.bool(forKey: key), false)
        
        UserDefaults.standard.set(URL(string: "www.baidu.com"), forKey: key)
        XCTAssertNotNil(UserDefaults.standard.url(forKey: key))
        XCTAssertEqual(UserDefaults.standard.url(forKey: key)?.absoluteString, "www.baidu.com")
        
        let date = Date(timeIntervalSince1970: 0.0)
        UserDefaults.standard.set(date, forKey: key)
        XCTAssertNotNil(UserDefaults.standard.date(forKey: key))
        XCTAssertEqual(UserDefaults.standard.date(forKey: key), date)
    }
    
    func test_codable() {
        let key = "decoder_test_key"
        let encoderObject = TestObject(itemID: 1)
        UserDefaults.standard.set(object: encoderObject, forKey: key)
        let decoderObject = UserDefaults.standard.object(TestObject.self, with: key)
        XCTAssertNotNil(decoderObject)
    }
}

private struct TestObject: Codable {

    var itemID: Int
}
