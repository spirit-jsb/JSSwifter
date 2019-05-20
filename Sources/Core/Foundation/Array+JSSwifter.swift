//
//  Array+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/20.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Array {
    
    // MARK:
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
