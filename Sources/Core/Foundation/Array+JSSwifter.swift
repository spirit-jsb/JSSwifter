//
//  Array+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/20.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

/// Array Decoder/Encoder Error
///
/// - invalidData: 无效的 Data
/// - invalidString: 无效的 String
/// - invalidType: 无效的解析类型
/// - invalidJSONObject: 无效的 JSON Object
public enum ArrayError: Swift.Error {
    case invalidData
    case invalidString
    case invalidType
    case invalidJSONObject
}

public extension Array {
    
    // MARK:
    
    /// 使用索引从 Array 中获取可选元素
    ///
    ///     var array = [0, 1, 2, 3, 4]
    ///     var element = array[safe: 3]
    ///     // element, 3
    ///     element = array[safe: 5]
    ///     // element, nil
    ///
    ///     array[safe: 2] = 10
    ///     element = array[safe: 2]
    ///     // element, 10
    ///     array[safe: 10] = 100
    ///     // array, [0, 1, 10, 3, 100]
    ///
    /// - Parameter index: 下标索引位置
    subscript(safe index: Int) -> Element? {
        set {
            let safeIndex = self.indices ~= index ? index : (self.indices.endIndex - 1)
            if let safeValue = newValue {
                self[safeIndex] = safeValue
            }
        }
        get {
            return self.indices ~= index ? self[index] : nil
        }
    }
    
    /// 在指定 Array 头部插入一个元素
    ///
    ///     var array = [2, 3, 4, 5]
    ///     array.prepend(1)
    ///     // array, [1, 2, 3, 4, 5]
    ///
    /// - Parameter newElement: 用于插入的元素
    mutating func prepend(_ newElement: Element) {
        self.insert(newElement, at: 0)
    }
    
    /// 对指定 Array 在给定下标索引位置安全的交换元素
    ///
    ///     var array = [1, 2, 3, 4, 5]
    ///     array.safeSwap(from: 3, to: 0)
    ///     // array[3], 1
    ///     // array[0], 4
    ///
    ///     var newArray = array
    ///     newArray.safeSwap(from: 1, to: 1)
    ///     // newArray, array
    ///
    ///     newArray = array
    ///     newArray.safeSwap(from: 1, to: 12)
    ///     // newArray, array
    ///
    ///     let emptyArray = [Int]()
    ///     var swappedEmptyArray = emptyArray
    ///     swappedEmptyArray.safeSwap(from: 1, to: 3)
    ///     // swappedEmptyArray, emptyArray
    ///
    /// - Parameters:
    ///   - index: 下标索引位置
    ///   - otherIndex: 用于交换的元素
    mutating func safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard self.startIndex..<self.endIndex ~= index else { return }
        guard self.startIndex..<self.endIndex ~= otherIndex else { return }
        self.swapAt(index, otherIndex)
    }
    
    /// 依据给定断言将指定 Array 分割为两部分
    ///
    ///     let input = [0, 1, 2, 3, 4, 5]
    ///     let (even, odd) = input.divided { $0 % 2 == 0 }
    ///     // even, [0, 2, 4]
    ///     // odd, [1, 3, 5]
    ///
    ///     let tuple = input.divided { $0 % 2 == 0 }
    ///     // tuple.matching, [0, 2, 4]
    ///     // tuple.nonMatching, [1, 3, 5]
    ///
    /// - Parameter condition: 断言条件
    /// - Returns: 两个数组，第一个数组包含断言条件为 true 的元素，第二个数组包含剩余的其他元素
    func divided(by condition: (Element) throws -> Bool) rethrows -> (matching: [Element], nonMatching: [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            try condition(element) ? matching.append(element) : nonMatching.append(element)
        }
        return (matching, nonMatching)
    }
    
    /// 基于可选键值路径排序数组
    ///
    ///     let array = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
    ///     var sort = array.sorted(by: \Person.age),
    ///     // sort, [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)]
    ///     sort = array.sorted(by: \Person.age, ascending: false),
    ///     // sort, [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)])
    ///
    /// - Parameters:
    ///   - path: 可选键值路径，类型必须是可比较的
    ///   - ascending: 是否顺序，默认值为 true
    /// - Returns: 基于可选键值路径的排序数组
    func sorted<T: Comparable>(by path: KeyPath<Element, T?>, ascending: Bool = true) -> [Element] {
        return self.sorted(by: { (lhs, rhs) -> Bool in
            guard let lhsValue = lhs[keyPath: path], let rhsValue = rhs[keyPath: path] else { return false }
            return ascending ? (lhsValue < rhsValue) : (lhsValue > rhsValue)
        })
    }
    
    /// 基于键值路径排序数组
    ///
    ///     let array = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
    ///     var sort = array.sorted(by: \Person.name),
    ///     // sort, [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)]
    ///     sort = array.sorted(by: \Person.name, ascending: false),
    ///     // sort, [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)]
    ///
    /// - Parameters:
    ///   - path: 键值路径，类型必须是可比较的
    ///   - ascending: 是否顺序，默认值为 true
    /// - Returns: 基于键值路径的排序数组
    func sorted<T: Comparable>(by path: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        return self.sorted(by: { (lhs, rhs) -> Bool in
            let lhsValue = lhs[keyPath: path]
            let rhsValue = rhs[keyPath: path]
            return ascending ? (lhsValue < rhsValue) : (lhsValue > rhsValue)
        })
    }
    
    /// 基于可选键值路径对数组排序
    ///
    ///     let array = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
    ///     array.sort(by: \Person.age),
    ///     // array, [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)]
    ///     array.sort(by: \Person.age, ascending: false),
    ///     // array, [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)])
    ///
    /// - Parameters:
    ///   - path: 可选键值路径，类型必须是可比较的
    ///   - ascending: 是否顺序，默认值为 true
    /// - Returns: 基于可选键值路径对数组排序
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<Element, T?>, ascending: Bool = true) -> [Element] {
        self = self.sorted(by: path, ascending: ascending)
        return self
    }
    
    /// 基于键值路径对数组排序
    ///
    ///     let array = [Person(name: "Jame", age: 23), Person(name: "Wade", age: 36), Person(name: "Rose", age: 29)]
    ///     array.sort(by: \Person.name),
    ///     // array, [Person(name: "Jame", age: 23), Person(name: "Rose", age: 29), Person(name: "Wade", age: 36)]
    ///     array.sort(by: \Person.name, ascending: false),
    ///     // array, [Person(name: "Wade", age: 36), Person(name: "Rose", age: 29), Person(name: "Jame", age: 23)]
    ///
    /// - Parameters:
    ///   - path: 键值路径，类型必须是可比较的
    ///   - ascending: 是否顺序，默认值为 true
    /// - Returns: 基于键值路径对数组排序
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self = self.sorted(by: path, ascending: ascending)
        return self
    }
    
    /// 将指定 Array 格式化为 JSON Data
    ///
    ///     let jsonArray = [1, 2, 3]
    ///     let data = try jsonArray.jsonData()
    ///     // data.isEmpty, false
    ///
    /// - Parameter options: Options for writing JSON data
    /// - Returns: 返回格式化后的 JSON Data
    /// - Throws: 抛出 ArrayError 异常信息
    func jsonData(_ options: JSONSerialization.WritingOptions = []) throws -> Data {
        guard JSONSerialization.isValidJSONObject(self) else {
            throw ArrayError.invalidJSONObject
        }
        return try JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    /// 将指定 Array 格式化为 Plist Data
    ///
    ///     let plistArray = ["1", "2", "3"]
    ///     let data = try plistArray.plistData()
    ///     // data.isEmpty, false
    ///
    /// - Parameter options: Options for writing Plist data
    /// - Returns: 返回格式化后的 Plist Data
    /// - Throws: 抛出 ArrayError 异常信息
    func plistData(_ options: PropertyListSerialization.WriteOptions = 0) throws -> Data {
        return try PropertyListSerialization.data(fromPropertyList: self, format: .xml, options: options)
    }
    
    /// 将给定的 JSON Data 解析为 Array 类型
    ///
    /// - Parameters:
    ///   - data: 需要解析的 JSON Data
    ///   - options: Options used when creating Foundation objects from JSON data
    /// - Returns: 返回解析后的 Array
    /// - Throws: 抛出 ArrayError 异常信息
    static func jsonArray(with data: Data?, options: JSONSerialization.ReadingOptions = []) throws -> [Element] {
        guard let jsonData = data, !jsonData.isEmpty else {
            throw ArrayError.invalidData
        }
        let json = try jsonData.jsonValueDecoded(options: options)
        guard let jsonArray = json as? [Element] else {
            throw ArrayError.invalidType
        }
        return jsonArray
    }
    
    /// 将给定的 Plist Data 解析为 Array 类型
    ///
    /// - Parameters:
    ///   - data: 需要解析的 Plist Data
    ///   - options: Options used when creating Foundation objects from Plist data
    /// - Returns: 返回解析后的 Array
    /// - Throws: 抛出 ArrayError 异常信息
    static func plistArray(with data: Data?, options: PropertyListSerialization.ReadOptions = []) throws -> [Element] {
        guard let plistData = data, !plistData.isEmpty else {
            throw ArrayError.invalidData
        }
        let plist = try plistData.plistValueDecoded(options: options)
        guard let plistArray = plist as? [Element] else {
            throw ArrayError.invalidType
        }
        return plistArray
    }
}

public extension Array where Element: Equatable {
    
    // MARK:
    
    /// 从指定 Array 中删除所有的给定 Element 项
    ///
    ///     var array = [0, 1, 2, 0, 3, 4, 5, 0, 0]
    ///     array.removeAll(0)
    ///     // array, [1, 2, 3, 4, 5]
    ///     array = [Int]()
    ///     array.removeAll(0)
    ///     // array, [Int]()
    ///
    /// - Parameter item: 需要删除的 Element 项
    @discardableResult
    mutating func removeAll(_ item: Element) -> [Element] {
        self.removeAll(where: { $0 == item })
        return self
    }
    
    /// 从指定 Array 中删除所有的给定 [Element] 项
    ///
    ///     var array = [0, 1, 2, 2, 0, 3, 4, 5, 0, 0]
    ///     array.removeAll([0, 2])
    ///     // array, [1, 3, 4, 5]
    ///     array.removeAll([])
    ///     // array, [1, 3, 4, 5]
    ///     array = [Int]()
    ///     array.removeAll([0, 2])
    ///     // array, [Int]()
    ///
    /// - Parameter items: 需要删除的 [Element] 项
    @discardableResult
    mutating func removeAll(_ items: [Element]) -> [Element] {
        guard !items.isEmpty else { return self }
        self.removeAll(where: { items.contains($0) })
        return self
    }
    
    /// 从指定 Array 中删除所有重复项目
    ///
    ///     var array = [1, 1, 2, 2, 3, 3, 3, 4, 5]
    ///     array.removeDuplicates()
    ///     // array, [1, 2, 3, 4, 5]
    ///
    /// - Returns: 返回删除所有重复项目后的结果
    @discardableResult
    mutating func removeDuplicates() -> [Element] {
        self = self.reduce(into: [Element](), {
            if !$0.contains($1) {
                $0.append($1)
            }
        })
        return self
    }
    
    /// 从指定 Array 中删除所有重复项目
    ///
    ///     var array: [Any] = [1, 1, 2, 2, 3, 3, 3, 4, 5]
    ///     array = (array as! [Int]).withoutDuplicates()
    ///     // (array as! [Int]), [1, 2, 3, 4, 5]
    ///     array = ["h", "e", "l", "l", "o"]
    ///     array = (array as! [String]).withoutDuplicates()
    ///     // (array as! [String]), ["h", "e", "l", "o"]
    ///
    /// - Returns: 返回删除所有重复项目后的结果
    func withoutDuplicates() -> [Element] {
        return self.reduce(into: [Element](), {
            if !$0.contains($1) {
                $0.append($1)
            }
        })
    }
}
