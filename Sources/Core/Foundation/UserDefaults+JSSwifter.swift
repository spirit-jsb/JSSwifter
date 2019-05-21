//
//  UserDefaults+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/21.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    // MARK:
    subscript(key: String) -> Any? {
        set {
            self.set(newValue, forKey: key)
        }
        get {
            return self.object(forKey: key)
        }
    }
    
    func date(forKey defaultName: String) -> Date? {
        return self.object(forKey: defaultName) as? Date
    }
    
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}
