//
//  Array+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/20.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public enum ArrayError: Swift.Error {
    case invalidData
    case invalidString
    case invalidType
}

public extension Array {
    
    // MARK:
    subscript(safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
    
    mutating func prepend(_ newElement: Element) {
        self.insert(newElement, at: 0)
    }
    
    mutating func safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard self.startIndex..<self.endIndex ~= index else { return }
        guard self.startIndex..<self.endIndex ~= otherIndex else { return }
        self.swapAt(index, otherIndex)
    }
    
    func divided(by condition: (Element) throws -> Bool) rethrows -> (matching: [Element], nonMatching: [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            try condition(element) ? matching.append(element) : nonMatching.append(element)
        }
        return (matching, nonMatching)
    }
    
    func sorted<T: Comparable>(by path: KeyPath<Element, T?>, ascending: Bool = true) -> [Element] {
        return self.sorted(by: { (lhs, rhs) -> Bool in
            guard let lhsValue = lhs[keyPath: path], let rhsValue = rhs[keyPath: path] else { return false }
            return ascending ? (lhsValue < rhsValue) : (lhsValue > rhsValue)
        })
    }
    
    func sorted<T: Comparable>(by path: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        return self.sorted(by: { (lhs, rhs) -> Bool in
            let lhsValue = lhs[keyPath: path]
            let rhsValue = rhs[keyPath: path]
            return ascending ? (lhsValue < rhsValue) : (lhsValue > rhsValue)
        })
    }
    
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<Element, T?>, ascending: Bool = true) -> [Element] {
        self = self.sorted(by: path, ascending: ascending)
        return self
    }
    
    @discardableResult
    mutating func sort<T: Comparable>(by path: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self = self.sorted(by: path, ascending: ascending)
        return self
    }
    
    func jsonData(_ options: JSONSerialization.WritingOptions = []) throws -> Data {
        guard JSONSerialization.isValidJSONObject(self) else {
            throw ArrayError.invalidType
        }
        return try JSONSerialization.data(withJSONObject: self, options: options)
    }
    
    func plistData(_ options: PropertyListSerialization.WriteOptions = 0) throws -> Data {
        return try PropertyListSerialization.data(fromPropertyList: self, format: .xml, options: options)
    }
    
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
    @discardableResult
    mutating func removeAll(_ item: Element) -> [Element] {
        self.removeAll(where: { $0 == item })
        return self
    }
    
    @discardableResult
    mutating func removeAll(_ items: [Element]) -> [Element] {
        guard !items.isEmpty else { return self }
        self.removeAll(where: { items.contains($0) })
        return self
    }
    
    @discardableResult
    mutating func removeDuplicates() -> [Element] {
        self = self.reduce(into: [Element](), {
            if !$0.contains($1) {
                $0.append($1)
            }
        })
        return self
    }
    
    func withoutDuplicates() -> [Element] {
        return self.reduce(into: [Element](), {
            if !$0.contains($1) {
                $0.append($1)
            }
        })
    }
}
