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
    
    /// Year Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.year -> 1970
    ///
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
    
    /// Month Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.month -> 1
    ///
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
    
    /// Day Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.day -> 2
    ///
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
    
    /// Hour Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.hour -> 3
    ///
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
    
    /// Minute Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.minute -> 46
    ///
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
    
    /// Second Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.second -> 40
    ///
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
    
    /// Nanosecond Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.nanosecond -> 123450040
    ///
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
    
    /// Quarter Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.quarter -> 1
    ///
    var quarter: Int {
        let month = Double(self.calendar.component(.month, from: self))
        let numberOfMonths = Double(self.calendar.monthSymbols.count)
        let numberOfMonthsInQuarter = numberOfMonths / 4.0
        return Int(ceil(month / numberOfMonthsInQuarter))
    }
    
    /// Weekday Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.weekday -> 6
    ///
    var weekday: Int {
        return self.calendar.component(.weekday, from: self)
    }
    
    /// WeekOfYear Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.weekOfYear -> 1
    ///
    var weekOfYear: Int {
        return self.calendar.component(.weekOfYear, from: self)
    }
    
    /// WeekOfMonth Component
    ///
    ///     var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
    ///     date.weekOfMonth -> 1
    ///
    var weekOfMonth: Int {
        return self.calendar.component(.weekOfMonth, from: self)
    }
    
    /// 是否为闰月
    ///
    ///     let date = Date(timeIntervalSince1970: 1500768000) // 北京时间 2017/7/23 8:0:0
    ///     date.isLeapMonth -> true
    ///
    var isLeapMonth: Bool {
        let calendar = Calendar(identifier: .chinese)
        return calendar.dateComponents([.month], from: self).isLeapMonth ?? false
    }
    
    /// 是否为闰年
    ///
    ///     let date = Date(timeIntervalSince1970: 1500768000) // 北京时间 2017/7/23 8:0:0
    ///     date.isLeapYear -> true
    ///
    var isLeapYear: Bool {
        let year = self.year
        return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)))
    }
    
    /// 检查指定 Date 是否在未来
    ///
    ///     let futureDate = Date(timeIntervalSinceNow: 512.0)
    ///     futureDate.isFuture -> true
    ///
    var isFuture: Bool {
        return self > Date()
    }
    
    /// 检查指定 Date 是否在过去
    ///
    ///     let oldDate = Date(timeIntervalSince1970: 512.0) // 1970/1/1 0:8:32
    ///     oldDate.isPast -> true
    ///
    var isPast: Bool {
        return self < Date()
    }
    
    /// 检查指定 Date 是否为今天
    ///
    ///     Date().isToday -> true
    ///
    var isToday: Bool {
        return self.calendar.isDateInToday(self)
    }
    
    /// 检查指定 Date 是否为昨天
    ///
    ///     let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)!
    ///     yesterday.isYesterday -> true
    ///
    var isYesterday: Bool {
        return self.calendar.isDateInYesterday(self)
    }
    
    /// 检查指定 Date 是否为明天
    ///
    ///     let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)!
    ///     yesterday.isTomorrow -> true
    ///
    var isTomorrow: Bool {
        return self.calendar.isDateInTomorrow(self)
    }
    
    /// 检查指定 Date 是否为周末
    ///
    ///     let date = Date(timeIntervalSince1970: 1558137600) // 北京时间 2019/5/18 8:0:0
    ///     date.isWeekend -> true
    ///
    var isWeekend: Bool {
        return self.calendar.isDateInWeekend(self)
    }
    
    /// 检查指定 Date 是否为工作日
    ///
    ///     let date = Date(timeIntervalSince1970: 1558137600) // 北京时间 2019/5/18 8:0:0
    ///     let dateAfter2Day = Calendar.current.date(byAdding: .day, value: 2, to: date)!
    ///     dateAfter2Day.isWorkday -> true
    ///
    var isWorkday: Bool {
        return !self.calendar.isDateInWeekend(self)
    }
    
    /// 检查指定 Date 是否在本周内
    ///
    ///     let date = Date()
    ///     date.isCurrentWeek -> true
    ///
    var isCurrentWeek: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    /// 检查指定 Date 是否在本月内
    ///
    ///     let date = Date()
    ///     date.isCurrentMonth -> true
    ///
    var isCurrentMonth: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .month)
    }
    
    /// 检查指定 Date 是否在本年内
    ///
    ///     let date = Date()
    ///     date.isCurrentYear -> true
    ///
    var isCurrentYear: Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: .year)
    }
    
    /// 返回指定 Date 依照 iso8601 ("yyyy-MM-dd'T'HH:mm:ss.SSS") 格式化生成的字符串
    var iso8601String: String {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self).appending("Z")
    }
    
    /// 返回指定 Date 前一天
    var yesterday: Date? {
        return self.calendar.date(byAdding: .day, value: -1, to: self)
    }
    
    /// 返回指定 Date 后一天
    var tomorrow: Date? {
        return self.calendar.date(byAdding: .day, value: 1, to: self)
    }
    
    /// 返回指定 Date UNIX 时间戳
    var unixTimestamp: TimeInterval {
        return self.timeIntervalSince1970
    }
    
    // MARK:
    private var calendar: Calendar {
        return Calendar.current
    }
    
    // MARK:
    
    /// 由 UNIX 时间戳初始化 Date 实例
    ///
    /// - Parameter unixTimestamp: UNIX 时间戳
    init(unixTimestamp: TimeInterval) {
        self.init(timeIntervalSince1970: unixTimestamp)
    }
    
    /// 由 iso8601 格式化字符串初始化 Date 实例
    ///
    /// - Parameter iso8601String: iso8601 格式化字符串
    init?(iso8601String: String) {
        // https://github.com/justinmakaila/NSDate-ISO-8601/blob/master/NSDateISO8601.swift
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = formatter.date(from: iso8601String) else { return nil }
        self = date
    }
    
    /// 由 dateString\format\timeZone 初始化 Date 实例
    ///
    /// - Parameters:
    ///   - dateString: 格式化字符串
    ///   - format: 格式字符串
    ///   - timeZone: 时区
    init?(dateString: String, format: String, timeZone: TimeZone? = nil) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
    
    // MARK:
    
    /// 通过为给定 Calendar.Component 组件添加给定数值返回一个新的 Date 实例
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.adding(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
    ///     let date3 = date.adding(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
    ///     let date4 = date.adding(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
    ///     let date5 = date.adding(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: Calendar.Component 组件
    ///   - value: value
    func adding(_ component: Calendar.Component, value: Int) -> Date? {
        return self.calendar.date(byAdding: component, value: value, to: self)
    }
    
    /// 通过为给定 Calendar.Component 组件修改给定数值返回一个新的 Date 实例
    ///
    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
    ///     let date2 = date.changing(.minute, value: 10) // "Jan 12, 2017, 6:10 PM"
    ///     let date3 = date.changing(.day, value: 4) // "Jan 4, 2017, 7:07 PM"
    ///     let date4 = date.changing(.month, value: 2) // "Feb 12, 2017, 7:07 PM"
    ///     let date5 = date.changing(.year, value: 2000) // "Jan 12, 2000, 7:07 PM"
    ///
    /// - Parameters:
    ///   - component: Calendar.Component 组件
    ///   - value: value descriptionvalue
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
    
    /// 检查指定 Date Calendar.Component 组件是否与当前 Date 的 Calendar.Component 组件相同
    ///
    ///     Date().isCurrent(.day) -> true
    ///     Date().isCurrent(.year) -> true
    ///
    /// - Parameter component: 需要对比的 Calendar.Component 组件
    func isCurrent(_ component: Calendar.Component) -> Bool {
        return self.calendar.isDate(self, equalTo: Date(), toGranularity: component)
    }
    
    /// 指定 Date 生成格式化字符串
    ///
    ///     Date().string(withFormat: "dd/MM/yyyy") -> "1/12/17"
    ///     Date().string(withFormat: "HH:mm") -> "23:50"
    ///     Date().string(withFormat: "dd/MM/yyyy HH:mm") -> "1/12/17 23:50"
    ///
    /// - Parameters:
    ///   - format: 格式字符串
    ///   - timeZone: 时区
    func string(withFormat format: String = "yyyy/MM/dd HH:mm", timeZone: TimeZone? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    /// 指定 Date 生成 date 字符串
    ///
    ///     Date().dateString(withStyle: .short) -> "1/12/17"
    ///     Date().dateString(withStyle: .medium) -> "Jan 12, 2017"
    ///     Date().dateString(withStyle: .long) -> "January 12, 2017"
    ///     Date().dateString(withStyle: .full) -> "Thursday, January 12, 2017"
    ///
    /// - Parameter style: DateFormatter.Style，默认值为 .medium
    func dateString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
    
    /// 指定 Date 生成 date time 字符串
    ///
    ///     Date().dateTimeString(withStyle: .short) -> "1/12/17, 7:32 PM"
    ///     Date().dateTimeString(withStyle: .medium) -> "Jan 12, 2017, 7:32:00 PM"
    ///     Date().dateTimeString(withStyle: .long) -> "January 12, 2017 at 7:32:00 PM GMT+3"
    ///     Date().dateTimeString(withStyle: .full) -> "Thursday, January 12, 2017 at 7:32:00 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter.Style，默认值为 .medium
    func dateTimeString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = style
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
    
    /// 指定 Date 生成 time 字符串
    ///
    ///     Date().timeString(withStyle: .short) -> "7:37 PM"
    ///     Date().timeString(withStyle: .medium) -> "7:37:02 PM"
    ///     Date().timeString(withStyle: .long) -> "7:37:02 PM GMT+3"
    ///     Date().timeString(withStyle: .full) -> "7:37:02 PM GMT+03:00"
    ///
    /// - Parameter style: DateFormatter.Style，默认值为 .medium
    func timeString(withStyle style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = style
        formatter.dateStyle = .none
        return formatter.string(from: self)
    }
    
    /// 计算指定 Date 与给定 Date 之间间隔 seconds
    func secondsSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date)
    }
    
    /// 计算指定 Date 与给定 Date 之间间隔 minutes
    func minutesSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 60.0
    }
    
    /// 计算指定 Date 与给定 Date 之间间隔 hours
    func hoursSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 3600.0
    }
    
    /// 计算指定 Date 与给定 Date 之间间隔 days
    func daysSince(_ date: Date) -> TimeInterval {
        return self.timeIntervalSince(date) / 86400.0
    }
    
    /// 检查指定 Date 是否在 startDate 与 endDate 之间
    ///
    /// - Parameters:
    ///   - startDate: 开始时间
    ///   - endDate: 结束时间
    ///   - includeBounds: 是否包含开始与结束时间，默认值为 false
    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
        if includeBounds {
            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
        }
        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
    }
    
    /// 返回指定范围内的随机 Date
    ///
    /// - Parameter range: 创建随机时间范围
    static func random(in range: Range<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    /// 返回指定范围内的随机 Date
    ///
    /// - Parameter range: 创建随机时间范围
    static func random(in range: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate))
    }
    
    /// 使用给定 RandomNumberGenerator 作为随机源，返回指定范围内的随机 Date
    ///
    /// - Parameters:
    ///   - range: 创建随机时间范围
    ///   - generator: 随机数生成器
    static func random<T>(in range: Range<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate..<range.upperBound.timeIntervalSinceReferenceDate, using: &generator))
    }
    
    /// 使用给定 RandomNumberGenerator 作为随机源，返回指定范围内的随机 Date
    ///
    /// - Parameters:
    ///   - range: 创建随机时间范围
    ///   - generator: 随机数生成器
    static func random<T>(in range: ClosedRange<Date>, using generator: inout T) -> Date where T: RandomNumberGenerator {
        return Date(timeIntervalSinceReferenceDate: TimeInterval.random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate, using: &generator))
    }
}
