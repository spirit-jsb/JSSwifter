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
    
    /// 使用下标从 UserDefaults 中获取对象
    ///
    /// - Parameter key: 唯一标识符
    subscript(key: String) -> Any? {
        set {
            self.set(newValue, forKey: key)
        }
        get {
            return self.object(forKey: key)
        }
    }
    
    /// 从 UserDefaults 中获取可选 Date 对象
    ///
    /// - Parameter defaultName: 唯一标识符
    /// - Returns: 返回获取的可选 Date 对象
    func date(forKey defaultName: String) -> Date? {
        return self.object(forKey: defaultName) as? Date
    }
    
    /// 从 UserDefaults 中获取遵循 Codable 协议的对象
    ///
    /// - Parameters:
    ///   - type: 遵循 Codable 协议的对象类型
    ///   - key: 唯一标识符
    ///   - decoder: 自定义 JSONDecoder 实例，默认值为 JSONDecoder()
    /// - Returns: 返回获取的可选、遵循 Codable 协议的对象
    func object<T: Codable>(_ type: T.Type, with key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try? decoder.decode(type.self, from: data)
    }
    
    /// 将遵循 Codable 协议的对象通过 UserDefaults 储存
    ///
    /// - Parameters:
    ///   - object: 用于储存的遵循 Codable 协议的对象
    ///   - key: 唯一标识符
    ///   - encoder: 自定义 JSONEncoder 实例，默认值为 JSONEncoder()
    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) {
        let data = try? encoder.encode(object)
        self.set(data, forKey: key)
    }
}
