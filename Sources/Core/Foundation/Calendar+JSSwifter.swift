//
//  Calendar+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Calendar {
    
    // MARK:
    
    /// 返回给定 Date 当月的天数
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     Calendar.current.numberOfDaysInMonth(for: date) -> 31
    ///
    /// - Parameter date: 给定 Date，用于计算当月天数
    /// - Returns: 返回给定 Date 当月的天数
    func numberOfDaysInMonth(for date: Date) -> Int? {
        return self.range(of: .day, in: .month, for: date)?.count
    }
}
