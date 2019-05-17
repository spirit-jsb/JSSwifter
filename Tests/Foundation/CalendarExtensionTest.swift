//
//  CalendarExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/17.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class CalendarExtensionTest: XCTestCase {
    
    func test_number_of_days_in_month() {
        let calendar = Calendar(identifier: .gregorian)
        let longMonths = [1, 3, 5, 7, 8, 10, 12]
        let shortMonths = [4, 6, 9, 11]
        
        let febDateComponent = DateComponents(year: 2015, month: 2)
        let febDate = calendar.date(from: febDateComponent)!
        
        let leapYearDateComponent = DateComponents(year: 2020, month: 2)
        let leapYearDate = calendar.date(from: leapYearDateComponent)!
        
        let longMonthDateComponents = longMonths.map { DateComponents(year: 2015, month: $0) }
        let shortMonthDateComponents = shortMonths.map { DateComponents(year: 2015, month: $0) }
        
        let longMonthDates = longMonthDateComponents.compactMap { calendar.date(from: $0) }
        let shortMonthDates = shortMonthDateComponents.compactMap { calendar.date(from: $0) }
        
        longMonthDates.forEach { XCTAssertEqual(calendar.numberOfDaysInMonth(for: $0), 31) }
        shortMonthDates.forEach { XCTAssertEqual(calendar.numberOfDaysInMonth(for: $0), 30) }
        
        XCTAssertEqual(calendar.numberOfDaysInMonth(for: febDate), 28)
        XCTAssertEqual(calendar.numberOfDaysInMonth(for: leapYearDate), 29)
    }
}
