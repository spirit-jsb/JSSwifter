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
    func numberOfDaysInMonth(for date: Date) -> Int? {
        return self.range(of: .day, in: .month, for: date)?.count
    }
}
