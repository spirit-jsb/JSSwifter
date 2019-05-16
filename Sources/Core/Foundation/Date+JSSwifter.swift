//
//  Date+JSSwifter.swift
//  JSSwifter
//
//  Created by Max on 2019/5/14.
//  Copyright © 2019 Max. All rights reserved.
//

import Foundation

public extension Date {
    
    // MARK:
    var year: Int {
        set {
            guard newValue > 0 else { return }
            let currentYear = self.calendar.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = self.calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.year, from: self)
        }
    }
    
    var month: Int {
        set {
            let allowedRange = self.calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentMonth = self.calendar.component(.month, from: self)
            let monthToAdd = newValue - currentMonth
            if let date = self.calendar.date(byAdding: .month, value: monthToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.month, from: self)
        }
    }
    
    var day: Int {
        set {
            let allowedRange = self.calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentDay = self.calendar.component(.day, from: self)
            let dayToAdd = newValue - currentDay
            if let date = self.calendar.date(byAdding: .day, value: dayToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.day, from: self)
        }
    }
    
    var hour: Int {
        set {
            let allowedRange = self.calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentHour = self.calendar.component(.hour, from: self)
            let hourToAdd = newValue - currentHour
            if let date = self.calendar.date(byAdding: .hour, value: hourToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.hour, from: self)
        }
    }
    
    var minute: Int {
        set {
            let allowedRange = self.calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentMinute = self.calendar.component(.minute, from: self)
            let minuteToAdd = newValue - currentMinute
            if let date = self.calendar.date(byAdding: .minute, value: minuteToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.minute, from: self)
        }
    }
    
    var second: Int {
        set {
            let allowedRange = self.calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentSecond = self.calendar.component(.second, from: self)
            let secondToAdd = newValue - currentSecond
            if let date = self.calendar.date(byAdding: .second, value: secondToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.second, from: self)
        }
    }
    
    var nanosecond: Int {
        set {
            let allowedRange = self.calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentNanosecond = self.calendar.component(.nanosecond, from: self)
            let nanosecondToAdd = newValue - currentNanosecond
            if let date = self.calendar.date(byAdding: .nanosecond, value: nanosecondToAdd, to: self) {
                self = date
            }
        }
        get {
            return self.calendar.component(.nanosecond, from: self)
        }
    }
    
    var quarter: Int {
        let month = Double(self.calendar.component(.month, from: self))
        let numberOfMonths = Double(self.calendar.monthSymbols.count)
        let numberOfMonthsInQuarter = numberOfMonths / 4.0
        return Int(ceil(month / numberOfMonthsInQuarter))
    }
    
    var weekday: Int {
        return self.calendar.component(.weekday, from: self)
    }
    
    var weekOfYear: Int {
        return self.calendar.component(.weekOfYear, from: self)
    }
    
    var weekOfMonth: Int {
        return self.calendar.component(.weekOfMonth, from: self)
    }
    
    var isLeapMonth: Bool {
        let calendar = Calendar(identifier: .chinese)
        return calendar.dateComponents([.month], from: self).isLeapMonth ?? false
    }
    
    var isLeapYear: Bool {
        let year = self.year
        return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)))
    }
    
    var isFuture: Bool {
        return self > Date()
    }
    
    var isPast: Bool {
        return self < Date()
    }
    
    var isToday: Bool {
        return self.calendar.isDateInToday(self)
    }
    
    var isYesterday: Bool {
        return self.calendar.isDateInYesterday(self)
    }
    
    var isTomorrow: Bool {
        return self.calendar.isDateInTomorrow(self)
    }
    
    var isWeekend: Bool {
        return self.calendar.isDateInWeekend(self)
    }
    
    var isWorkday: Bool {
        return !self.calendar.isDateInWeekend(self)
    }
    
    var isCurrentWeek: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    var isCurrentMonth: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    var isCurrentYear: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    
    var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self).appending("Z")
    }
    
    var yesterday: Date? {
        return self.calendar.date(byAdding: .day, value: -1, to: self)
    }
    
    var tomorrow: Date? {
        return self.calendar.date(byAdding: .day, value: 1, to: self)
    }
    
    var unixTimestamp: TimeInterval {
        return self.timeIntervalSince1970
    }
    
    // MARK:
    private var calendar: Calendar {
        return Calendar.current
    }
    
    // MARK:
    init(unixTimestamp: TimeInterval) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
    init?(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = formatter.date(from: iso8601String) else { return nil }
        self = date
    }
    
    init?(dateString: String, format: String, timeZone: TimeZone? = nil) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
    
    // MARK:
    func adding(_ component: Calendar.Component, value: Int) -> Date? {
        return self.calendar.date(byAdding: component, value: value, to: self)
    }
    
    func changing(_ component: Calendar.Component, value: Int) -> Date? {
        var changingDate: Date? = nil
        switch component {
        case .nanosecond:
            let allowedRange = self.calendar.range(of: .nanosecond, in: .second, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentNanosecond = self.calendar.component(.nanosecond, from: self)
            let nanosecondToAdd = value - currentNanosecond
            changingDate = self.calendar.date(byAdding: .nanosecond, value: nanosecondToAdd, to: self)
        case .second:
            let allowedRange = self.calendar.range(of: .second, in: .minute, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentSecond = self.calendar.component(.second, from: self)
            let secondToAdd = value - currentSecond
            changingDate = self.calendar.date(byAdding: .second, value: secondToAdd, to: self)
        case .minute:
            let allowedRange = self.calendar.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMinute = self.calendar.component(.minute, from: self)
            let minuteToAdd = value - currentMinute
            changingDate = self.calendar.date(byAdding: .minute, value: minuteToAdd, to: self)
        case .hour:
            let allowedRange = self.calendar.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentHour = self.calendar.component(.hour, from: self)
            let hourToAdd = value - currentHour
            changingDate = self.calendar.date(byAdding: .hour, value: hourToAdd, to: self)
        case .day:
            let allowedRange = self.calendar.range(of: .day, in: .month, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentDay = self.calendar.component(.day, from: self)
            let dayToAdd = value - currentDay
            changingDate = self.calendar.date(byAdding: .day, value: dayToAdd, to: self)
        case .month:
            let allowedRange = self.calendar.range(of: .month, in: .year, for: self)!
            guard allowedRange.contains(value) else { return nil }
            let currentMonth = self.calendar.component(.month, from: self)
            let monthToAdd = value - currentMonth
            changingDate = self.calendar.date(byAdding: .month, value: monthToAdd, to: self)
        case .year:
            guard value > 0 else { return nil }
            let currentYear = self.calendar.component(.year, from: self)
            let yearsToAdd = value - currentYear
            changingDate = self.calendar.date(byAdding: .year, value: yearsToAdd, to: self)
        default:
            changingDate = self.calendar.date(bySetting: component, value: value, of: self)
        }
        return changingDate
    }
    
    func isCurrent(_ component: Calendar.Component) -> Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: component)
    }
    
    func string(withFormat format: String = "yyyy/MM/dd HH:mm", timeZone: TimeZone? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    func dateString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
    
    func dateTimeString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = style
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
    
    func timeString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = style
        formatter.dateStyle = .none
        return formatter.string(from: self)
    }
    
    func secondsSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date)
    }
    
    func minutesSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 60.0
    }
    
    func hoursSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 3600.0
    }
    
    func daysSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 86400.0
    }
    
    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }
        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }
    
    static func random(in range: Range<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    static func random(in range: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    static func random<T>(in range: Range<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate, using: &generator))
    }
    
    static func random<T>(in range: ClosedRange<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate, using: &generator))
    }
}
