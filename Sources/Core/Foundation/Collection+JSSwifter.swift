//
//  Collection+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/23.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Collection {
    
    // MARK:
    
    /// 使用索引从 Collection 中获取可选元素
    ///
    ///     let collection = [1, 2, 3, 4, 5]
    ///     self.collection[safe: 2] -> 3
    ///     self.collection[safe: 1] -> 2
    ///     self.collection[safe: 9] -> nil
    ///
    /// - Parameter index: 索引
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
    
    /// 并行的为 Collection 中每个元素执行闭包中的函数
    ///
    ///     let collection = [1, 2, 3, 4, 5]
    ///     self.collection.forEachInParallel { (item) in
    ///         self.collection.contains(item) -> true
    ///     }
    ///
    /// - Parameter each: 闭包函数
    func forEachInParallel(_ each: (Self.Element) -> Void) {
        let indicesArray = Array(self.indices)
        DispatchQueue.concurrentPerform(iterations: indicesArray.count, execute: { (index) in
            let elementIndex = indicesArray[index]
            each(self[elementIndex])
        })
    }
}

public extension Collection where Index == Int {
    
    // MARK:
    
    /// 获得满足条件的元素的索引
    ///
    ///     let array = [0, 1, 2, 3, 4, 5, 6, 7, 9, 8]
    ///     let indices = array.indices { $0 % 2 == 0 }
    ///     // indices, [0, 2, 4, 6, 9]
    ///     let emptyArray: [Int] = []
    ///     let emptyIndices = emptyArray.indices { $0 % 2 == 0 }
    ///     // emptyIndices, nil
    ///
    /// - Parameter condition: 条件函数闭包
    /// - Returns: Collection 中所有满足条件的元素的索引
    func indices(where condition: (Element) throws -> Bool) rethrows -> [Index]? {
        var indices: [Index] = []
        for (index, value) in self.lazy.enumerated() where try condition(value) {
            indices.append(index)
        }
        return indices.isEmpty ? nil : indices
    }
    
    /// 将指定 Collection 依照给定 slice 大小分割，并在给定函数闭包中返回分割结果
    ///
    ///     var iterations = 0
    ///     let array = ["a", "b", "c", "d", "e", "f", "g"]
    ///     array.forEach(slice: 2, body: { (slices) in
    ///         switch iterations {
    ///         case 0:
    ///             slices -> ["a", "b"]
    ///         case 1:
    ///             slices -> ["c", "d"]
    ///         case 2:
    ///             slices -> ["e", "f"]
    ///         case 3:
    ///             slices -> ["g"]
    ///         default:
    ///             break
    ///         }
    ///         iterations += 1
    ///     })
    ///
    /// - Parameters:
    ///   - slice: 分割大小
    ///   - body: 用于返回分割结果的函数闭包
    func forEach(slice: Int, body: ([Element]) throws -> Void) rethrows {
        guard slice > 0, !self.isEmpty else { return }
        var value: Int = 0
        while value < self.count {
            try body(Array(self[Swift.max(value, self.startIndex)..<Swift.min(value + slice, self.endIndex)]))
            value += slice
        }
    }
    
    /// 将指定 Collection 依照给定 size 大小分割，并将分割后的结果返回
    ///
    ///     var array = ["a", "b", "c", "d", "e", "f", "g"]
    ///     let slices = array.group(by: 2) -> [["a", "b"], ["c", "d"], ["e", "f"], ["g"]]
    ///
    /// - Parameter size: 分割大小
    func group(by size: Int) -> [[Element]]? {
        guard size > 0, !self.isEmpty else { return nil }
        var value: Int = 0
        var slices: [[Element]] = []
        while value < self.count {
            slices.append(Array(self[Swift.max(value, self.startIndex)..<Swift.min(value + size, self.endIndex)]))
            value += size
        }
        return slices
    }
}

public extension Collection where Element == IntegerLiteralType, Index == Int {
    
    // MARK:
    
    /// Collection 中所有元素的平均值
    ///
    ///     [1.2, 2.4, 4.2, 3.1, 5.9].average() ->3.36
    ///     [Double]().average() -> 0.0
    ///
    func average() -> Double {
        return self.isEmpty ? 0.0 : Double(self.reduce(0, +)) / Double(self.count)
    }
}

public extension Collection where Element: FloatingPoint {
    
    // MARK:
    
    /// Collection 中所有元素的平均值
    ///
    ///     [1, 2, 3, 4, 5].average() -> 3
    ///     [Int]().average() -> 0
    ///
    func average() -> Element {
        return self.isEmpty ? 0 : self.reduce(0, {$0 + $1}) / Element(self.count)
    }
}
