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
    subscript(safe index: Index) -> Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
    
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
    func indices(where condition: (Element) throws -> Bool) rethrows -> [Index]? {
        var indices: [Index] = []
        for (index, value) in self.lazy.enumerated() where try condition(value) {
            indices.append(index)
        }
        return indices.isEmpty ? nil : indices
    }
    
    func forEach(slice: Int, body: ([Element]) throws -> Void) rethrows {
        guard slice > 0, !self.isEmpty else { return }
        var value: Int = 0
        while value < self.count {
            try body(Array(self[Swift.max(value, self.startIndex)..<Swift.min(value + slice, self.endIndex)]))
            value += slice
        }
    }
    
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
    func average() -> Double {
        return self.isEmpty ? 0.0 : Double(self.reduce(0, +)) / Double(self.count)
    }
}

public extension Collection where Element: FloatingPoint {
    
    // MARK:
    func average() -> Element {
        return self.isEmpty ? 0 : self.reduce(0, {$0 + $1}) / Element(self.count)
    }
}
