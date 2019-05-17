//
//  DateExtensionTest.swift
//  JSSwifter-Tests
//
//  Created by Max on 2019/5/16.
//  Copyright © 2019 Max. All rights reserved.
//

import XCTest
@testable import JSSwifter

class DateExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        NSTimeZone.default = TimeZone(abbreviation: "UTC")!
    }
    
    func test_year() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.year, 1970)
        
        var isLowerComponentsValid: Bool {
            guard date.month == 1 else { return false }
            guard date.day == 2 else { return false }
            guard date.hour == 3 else { return false }
            guard date.minute == 46 else { return false }
            guard date.second == 40 else { return false }
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.year = 2000
        XCTAssertEqual(date.year, 2000)
        XCTAssert(isLowerComponentsValid)
        
        date.year = 2017
        XCTAssertEqual(date.year, 2017)
        XCTAssert(isLowerComponentsValid)
        
        date.year = 1988
        XCTAssertEqual(date.year, 1988)
        XCTAssert(isLowerComponentsValid)
        
        date.year = -100
        XCTAssertEqual(date.year, 1988)
        XCTAssert(isLowerComponentsValid)
        
        date.year = 0
        XCTAssertEqual(date.year, 1988)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_month() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.month, 1)
        
        var isLowerComponentsValid: Bool {
            guard date.day == 2 else { return false }
            guard date.hour == 3 else { return false }
            guard date.minute == 46 else { return false }
            guard date.second == 40 else { return false }
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.month = 2
        XCTAssertEqual(date.month, 2)
        XCTAssert(isLowerComponentsValid)
        
        date.month = 14
        XCTAssertEqual(date.month, 2)
        XCTAssert(isLowerComponentsValid)
        
        date.month = 8
        XCTAssertEqual(date.month, 8)
        XCTAssert(isLowerComponentsValid)
        
        date.month = -3
        XCTAssertEqual(date.month, 8)
        XCTAssert(isLowerComponentsValid)
        
        date.month = 0
        XCTAssertEqual(date.month, 8)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_day() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.day, 2)
        
        var isLowerComponentsValid: Bool {
            guard date.hour == 3 else { return false }
            guard date.minute == 46 else { return false }
            guard date.second == 40 else { return false }
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.day = 4
        XCTAssertEqual(date.day, 4)
        XCTAssert(isLowerComponentsValid)
        
        date.day = 1
        XCTAssertEqual(date.day, 1)
        XCTAssert(isLowerComponentsValid)
        
        date.day = 32
        XCTAssertEqual(date.day, 1)
        XCTAssert(isLowerComponentsValid)
        
        date.day = -10
        XCTAssertEqual(date.day, 1)
        XCTAssert(isLowerComponentsValid)
        
        date.day = 0
        XCTAssertEqual(date.day, 1)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_hour() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.hour, 3)
        
        var isLowerComponentsValid: Bool {
            guard date.minute == 46 else { return false }
            guard date.second == 40 else { return false }
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.hour = -1
        XCTAssertEqual(date.hour, 3)
        XCTAssert(isLowerComponentsValid)
        
        date.hour = 25
        XCTAssertEqual(date.hour, 3)
        XCTAssert(isLowerComponentsValid)
        
        date.hour = 19
        XCTAssertEqual(date.hour, 19)
        XCTAssert(isLowerComponentsValid)
        
        date.hour = 0
        XCTAssertEqual(date.hour, 0)
        XCTAssert(isLowerComponentsValid)
        
        date.hour = 1
        XCTAssertEqual(date.hour, 1)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_minute() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.minute, 46)
        
        var isLowerComponentsValid: Bool {
            guard date.second == 40 else { return false }
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.minute = 61
        XCTAssertEqual(date.minute, 46)
        XCTAssert(isLowerComponentsValid)
        
        date.minute = 25
        XCTAssertEqual(date.minute, 25)
        XCTAssert(isLowerComponentsValid)
        
        date.minute = 7
        XCTAssertEqual(date.minute, 7)
        XCTAssert(isLowerComponentsValid)
        
        date.minute = -10
        XCTAssertEqual(date.minute, 7)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_second() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.second, 40)
        
        var isLowerComponentsValid: Bool {
            guard date.nanosecond == 123450040 else { return false }
            return true
        }
        
        date.second = -1
        XCTAssertEqual(date.second, 40)
        XCTAssert(isLowerComponentsValid)
        
        date.second = 900
        XCTAssertEqual(date.second, 40)
        XCTAssert(isLowerComponentsValid)
        
        date.second = 16
        XCTAssertEqual(date.second, 16)
        XCTAssert(isLowerComponentsValid)
        
        date.second = 55
        XCTAssertEqual(date.second, 55)
        XCTAssert(isLowerComponentsValid)
    }
    
    func test_nanosecond() {
        var date = Date(timeIntervalSince1970: 100000.123450040) /// 1970/1/2 3:46:40:123450040 UTC
        XCTAssertEqual(date.nanosecond, 123450040)
        
        date.nanosecond = -1
        XCTAssertEqual(date.nanosecond, 123450040)
        
        date.nanosecond = 10000
        XCTAssert(date.nanosecond >= 1000)
        XCTAssert(date.nanosecond <= 100000)
    }
    
    func test_quarter() {
        let date1 = Date(timeIntervalSince1970: 0.0)
        XCTAssertEqual(date1.quarter, 1)
        let date2 = Calendar.current.date(byAdding: .month, value: 4, to: date1)
        XCTAssertEqual(date2?.quarter, 2)
        let date3 = Calendar.current.date(byAdding: .month, value: 8, to: date1)
        XCTAssertEqual(date3?.quarter, 3)
        let date4 = Calendar.current.date(byAdding: .month, value: 11, to: date1)
        XCTAssertEqual(date4?.quarter, 4)
    }
    
    func test_weekday() {
        let date = Date(timeIntervalSince1970: 100000) // 北京时间 1970/1/2 11:46:40 星期五
        XCTAssertEqual(date.weekday, 6)
    }
    
    func test_week_of_year() {
        let date = Date(timeIntervalSince1970: 0.0)
        XCTAssertEqual(date.weekOfYear, 1)
        let dateAfter7Day = Calendar.current.date(byAdding: .day, value: 7, to: date)
        XCTAssertEqual(dateAfter7Day?.weekOfYear, 2)
        let originalDate = Calendar.current.date(byAdding: .day, value: -7, to: dateAfter7Day!)
        XCTAssertEqual(originalDate?.weekOfYear, 1)
    }
    
    func test_week_of_month() {
        let date = Date(timeIntervalSince1970: 0.0)
        XCTAssertEqual(date.weekOfMonth, 1)
        let dateAfter7Day = Calendar.current.date(byAdding: .day, value: 7, to: date)
        XCTAssertEqual(dateAfter7Day?.weekOfMonth, 2)
        let originalDate = Calendar.current.date(byAdding: .day, value: -7, to: dateAfter7Day!)
        XCTAssertEqual(originalDate?.weekOfMonth, 1)
    }
    
    func test_is_leap_month() {
        let date = Date(timeIntervalSince1970: 1500768000) // 北京时间 2017/7/23 8:0:0
        XCTAssertTrue(date.isLeapMonth)
        let dateBefore7Day = Calendar.current.date(byAdding: .day, value: -7, to: date)!
        XCTAssertFalse(dateBefore7Day.isLeapMonth)
    }
    
    func test_is_leap_year() {
        let date = Date(timeIntervalSince1970: 958406400) // 北京时间 2000/5/16 0:0:0 闰年
        XCTAssertTrue(date.isLeapYear)
        let dateAfter4Year = Calendar.current.date(byAdding: .year, value: 4, to: date)!
        XCTAssertTrue(dateAfter4Year.isLeapYear)
        let dateBefore3Year = Calendar.current.date(byAdding: .year, value: -2, to: date)!
        XCTAssertFalse(dateBefore3Year.isLeapYear)
    }
    
    func test_is_future() {
        let oldDate = Date(timeIntervalSince1970: 512.0) // 1970/1/1 0:8:32
        let futureDate = Date(timeIntervalSinceNow: 512.0)
        XCTAssertTrue(futureDate.isFuture)
        XCTAssertFalse(oldDate.isFuture)
    }
    
    func test_is_past() {
        let oldDate = Date(timeIntervalSince1970: 512.0) // 1970/1/1 0:8:32
        let futureDate = Date(timeIntervalSinceNow: 512.0)
        XCTAssertFalse(futureDate.isPast)
        XCTAssertTrue(oldDate.isPast)
    }
    
    func test_is_today() {
        let date = Date()
        XCTAssertTrue(date.isToday)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        XCTAssertFalse(tomorrow.isToday)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        XCTAssertFalse(yesterday.isToday)
    }
    
    func test_is_yesterday() {
        let date = Date()
        XCTAssertFalse(date.isYesterday)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        XCTAssertFalse(tomorrow.isYesterday)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        XCTAssertTrue(yesterday.isYesterday)
    }
    
    func test_is_tomorrow() {
        let date = Date()
        XCTAssertFalse(date.isTomorrow)
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        XCTAssertTrue(tomorrow.isTomorrow)
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)!
        XCTAssertFalse(yesterday.isTomorrow)
    }
    
    func test_is_weekend() {
        let date = Date(timeIntervalSince1970: 1558137600) // 北京时间 2019/5/18 8:0:0
        XCTAssertTrue(date.isWeekend)
        let dateAfter2Day = Calendar.current.date(byAdding: .day, value: 2, to: date)!
        XCTAssertFalse(dateAfter2Day.isWeekend)
    }
    
    func test_is_workday() {
        let date = Date(timeIntervalSince1970: 1558137600) // 北京时间 2019/5/18 8:0:0
        XCTAssertFalse(date.isWorkday)
        let dateAfter2Day = Calendar.current.date(byAdding: .day, value: 2, to: date)!
        XCTAssertTrue(dateAfter2Day.isWorkday)
    }
    
    func test_is_current_week() {
        let date = Date()
        XCTAssertTrue(date.isCurrentWeek)
        let dateAfter7Day = Calendar.current.date(byAdding: .day, value: 7, to: date)!
        XCTAssertFalse(dateAfter7Day.isCurrentWeek)
    }
    
    func test_is_current_month() {
        let date = Date()
        XCTAssertTrue(date.isCurrentMonth)
        let dateAfter1Month = Calendar.current.date(byAdding: .month, value: 1, to: date)!
        XCTAssertFalse(dateAfter1Month.isCurrentMonth)
    }
    
    func test_is_current_year() {
        let date = Date()
        XCTAssertTrue(date.isCurrentYear)
        let dateAfter1Year = Calendar.current.date(byAdding: .year, value: 1, to: date)!
        XCTAssertFalse(dateAfter1Year.isCurrentYear)
    }
    
    func test_iso8601_string() {
        let date = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
        XCTAssertEqual(date.iso8601String, "1970-01-01T00:08:32.000Z")
    }
    
    func test_yesterday() {
        let date = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)
        XCTAssertEqual(date.yesterday, yesterday)
    }
    
    func test_tomorrow() {
        let date = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)
        XCTAssertEqual(date.tomorrow, tomorrow)
    }
    
    func test_unix_timestamp() {
        let date = Date(timeIntervalSince1970: 512)
        XCTAssertEqual(date.unixTimestamp, 512)
    }
    
    func test_init_unix_timestamp() {
        let date = Date(timeIntervalSince1970: 512)
        let dateFromUnixTimestamp = Date(unixTimestamp: 512)
        XCTAssertEqual(date, dateFromUnixTimestamp)
    }
    
    func test_init_iso8601_string() {
        let date = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
        let dateFromISO8601String = Date(iso8601String: "1970-01-01T00:08:32.000Z")
        XCTAssertEqual(date, dateFromISO8601String)
        XCTAssertNil(Date(iso8601String: "hello"))
    }
    
    func test_init_date_string() {
        let date = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
        let dateString = "1970-01-01 00:08:32"
        
        var dateFromDateString = Date(dateString: dateString, format: "yyyy-MM-dd HH:mm:ss")
        XCTAssertEqual(date, dateFromDateString)
        XCTAssertNil(Date(dateString: dateString, format: "hellow"))
        
        dateFromDateString = Date(dateString: dateString, format: "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone(abbreviation: "GMT+0800"))
        let dateBefore8Hours = Calendar.current.date(byAdding: .hour, value: -8, to: date)
        XCTAssertEqual(dateBefore8Hours, dateFromDateString)
    }
    
    func test_adding() {
        let date = Date(timeIntervalSince1970: 3610) // 1970-01-01T01:00:10.000Z
        
        XCTAssertEqual(date.adding(.second, value: 0), date)
        let date1 = date.adding(.second, value: 10)
        XCTAssertEqual(date1?.second, date.second + 10)
        XCTAssertEqual(date1?.adding(.second, value: -10), date)
        
        XCTAssertEqual(date.adding(.minute, value: 0), date)
        let date2 = date.adding(.minute, value: 10)
        XCTAssertEqual(date2?.minute, date.minute + 10)
        XCTAssertEqual(date2?.adding(.minute, value: -10), date)
        
        XCTAssertEqual(date.adding(.hour, value: 0), date)
        let date3 = date.adding(.hour, value: 2)
        XCTAssertEqual(date3?.hour, date.hour + 2)
        XCTAssertEqual(date3?.adding(.hour, value: -2), date)
        
        XCTAssertEqual(date.adding(.day, value: 0), date)
        let date4 = date.adding(.day, value: 2)
        XCTAssertEqual(date4?.day, date.day + 2)
        XCTAssertEqual(date4?.adding(.day, value: -2), date)
        
        XCTAssertEqual(date.adding(.weekOfYear, value: 0), date)
        let date5 = date.adding(.weekOfYear, value: 1)
        XCTAssertEqual(date5?.day, date.day + 7)
        XCTAssertEqual(date5?.adding(.weekOfYear, value: -1), date)
        
        XCTAssertEqual(date.adding(.weekOfMonth, value: 0), date)
        let date6 = date.adding(.weekOfMonth, value: 1)
        XCTAssertEqual(date6?.day, date.day + 7)
        XCTAssertEqual(date6?.adding(.weekOfMonth, value: -1), date)
        
        XCTAssertEqual(date.adding(.month, value: 0), date)
        let date7 = date.adding(.month, value: 2)
        XCTAssertEqual(date7?.month, date.month + 2)
        XCTAssertEqual(date7?.adding(.month, value: -2), date)
        
        XCTAssertEqual(date.adding(.year, value: 0), date)
        let date8 = date.adding(.year, value: 4)
        XCTAssertEqual(date8?.year, date.year + 4)
        XCTAssertEqual(date8?.adding(.year, value: -4), date)
    }
    
    func test_changing() {
        let date = Date(timeIntervalSince1970: 0)
        
        XCTAssertNil(date.changing(.nanosecond, value: -10))
        XCTAssertNotNil(date.changing(.nanosecond, value: 123450040))
        XCTAssertEqual(date.changing(.nanosecond, value: 123450040)?.nanosecond, 123450040)
        
        XCTAssertNil(date.changing(.second, value: -10))
        XCTAssertNil(date.changing(.second, value: 70))
        XCTAssertNotNil(date.changing(.second, value: 20))
        XCTAssertEqual(date.changing(.second, value: 20)?.second, 20)
        
        XCTAssertNil(date.changing(.minute, value: -10))
        XCTAssertNil(date.changing(.minute, value: 70))
        XCTAssertNotNil(date.changing(.minute, value: 20))
        XCTAssertEqual(date.changing(.minute, value: 20)?.minute, 20)
        
        XCTAssertNil(date.changing(.hour, value: -2))
        XCTAssertNil(date.changing(.hour, value: 25))
        XCTAssertNotNil(date.changing(.hour, value: 4))
        XCTAssertEqual(date.changing(.hour, value: 4)?.hour, 4)
        
        XCTAssertNil(date.changing(.day, value: -2))
        XCTAssertNil(date.changing(.day, value: 35))
        XCTAssertNotNil(date.changing(.day, value: 13))
        XCTAssertEqual(date.changing(.day, value: 13)?.day, 13)
        
        XCTAssertNil(date.changing(.month, value: -2))
        XCTAssertNil(date.changing(.month, value: 13))
        XCTAssertNotNil(date.changing(.month, value: 8))
        XCTAssertEqual(date.changing(.month, value: 8)?.month, 8)
        
        XCTAssertNil(date.changing(.year, value: -2))
        XCTAssertNil(date.changing(.year, value: 0))
        XCTAssertNotNil(date.changing(.year, value: 2015))
        XCTAssertEqual(date.changing(.year, value: 2015)?.year, 2015)
        
        XCTAssertEqual(date.changing(.weekOfMonth, value: 10), Calendar.current.date(bySetting: .weekOfMonth, value: 10, of: date))
        XCTAssertEqual(date.changing(.weekOfYear, value: 10), Calendar.current.date(bySetting: .weekOfYear, value: 10, of: date))
    }
    
    func test_is_current() {
        let date = Date()
        let oldDate = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
        
        XCTAssertTrue(date.isCurrent(.second))
        XCTAssertFalse(oldDate.isCurrent(.second))
        
        XCTAssertTrue(date.isCurrent(.minute))
        XCTAssertFalse(oldDate.isCurrent(.minute))
        
        XCTAssertTrue(date.isCurrent(.hour))
        XCTAssertFalse(oldDate.isCurrent(.hour))
        
        XCTAssertTrue(date.isCurrent(.day))
        XCTAssertFalse(oldDate.isCurrent(.day))
        
        XCTAssertTrue(date.isCurrent(.month))
        XCTAssertFalse(oldDate.isCurrent(.month))
        
        XCTAssertTrue(date.isCurrent(.year))
        XCTAssertFalse(oldDate.isCurrent(.year))
        
        XCTAssertTrue(date.isCurrent(.weekOfMonth))
        XCTAssertFalse(oldDate.isCurrent(.weekOfMonth))
        
        XCTAssertTrue(date.isCurrent(.weekOfYear))
        XCTAssertFalse(oldDate.isCurrent(.weekOfYear))
    }
    
    func test_string_with_format() {
        let date = Date(timeIntervalSince1970: 512) // 1970-01-01T00:08:32.000Z
        XCTAssertEqual(date.string(), "1970/01/01 00:08")
        XCTAssertEqual(date.string(withFormat: "yyyy|MM|dd HH:mm:ss"), "1970|01|01 00:08:32")
        XCTAssertEqual(date.string(timeZone: TimeZone(abbreviation: "GMT+0800")), "1970/01/01 08:08")
    }
    
    func test_date_string_with_style() {
        let date = Date(timeIntervalSince1970: 512)
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        
        formatter.dateStyle = .short
        XCTAssertEqual(date.dateString(withStyle: .short), formatter.string(from: date))
        
        formatter.dateStyle = .medium
        XCTAssertEqual(date.dateString(withStyle: .medium), formatter.string(from: date))
        
        formatter.dateStyle = .long
        XCTAssertEqual(date.dateString(withStyle: .long), formatter.string(from: date))
        
        formatter.dateStyle = .full
        XCTAssertEqual(date.dateString(withStyle: .full), formatter.string(from: date))
    }
    
    func test_date_time_string_with_style() {
        let date = Date(timeIntervalSince1970: 512)
        let formatter = DateFormatter()
        
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        XCTAssertEqual(date.dateTimeString(withStyle: .short), formatter.string(from: date))
        
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        XCTAssertEqual(date.dateTimeString(withStyle: .medium), formatter.string(from: date))
        
        formatter.timeStyle = .long
        formatter.dateStyle = .long
        XCTAssertEqual(date.dateTimeString(withStyle: .long), formatter.string(from: date))
        
        formatter.timeStyle = .full
        formatter.dateStyle = .full
        XCTAssertEqual(date.dateTimeString(withStyle: .full), formatter.string(from: date))
    }
    
    func test_time_string_with_style() {
        let date = Date(timeIntervalSince1970: 512)
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        
        formatter.timeStyle = .short
        XCTAssertEqual(date.timeString(withStyle: .short), formatter.string(from: date))
        
        formatter.timeStyle = .medium
        XCTAssertEqual(date.timeString(withStyle: .medium), formatter.string(from: date))
        
        formatter.timeStyle = .long
        XCTAssertEqual(date.timeString(withStyle: .long), formatter.string(from: date))
        
        formatter.timeStyle = .full
        XCTAssertEqual(date.timeString(withStyle: .full), formatter.string(from: date))
    }
    
    func test_seconds_since() {
        let date1 = Date(timeIntervalSince1970: 100)
        let date2 = Date(timeIntervalSince1970: 180)
        XCTAssertEqual(date2.secondsSince(date1), 80)
        XCTAssertEqual(date1.secondsSince(date2), -80)
    }
    
    func test_minutes_since() {
        let date1 = Date(timeIntervalSince1970: 120)
        let date2 = Date(timeIntervalSince1970: 180)
        XCTAssertEqual(date2.minutesSince(date1), 1)
        XCTAssertEqual(date1.minutesSince(date2), -1)
    }
    
    func test_hours_since() {
        let date1 = Date(timeIntervalSince1970: 3600)
        let date2 = Date(timeIntervalSince1970: 7200)
        XCTAssertEqual(date2.hoursSince(date1), 1)
        XCTAssertEqual(date1.hoursSince(date2), -1)
    }
    
    func test_days_since() {
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = Date(timeIntervalSince1970: 86400)
        XCTAssertEqual(date2.daysSince(date1), 1)
        XCTAssertEqual(date1.daysSince(date2), -1)
    }
    
    func test_is_between() {
        let date1 = Date(timeIntervalSince1970: 0)
        let date2 = date1.addingTimeInterval(60)
        let date3 = date2.addingTimeInterval(60)
        
        XCTAssertTrue(date2.isBetween(date1, date3))
        XCTAssertFalse(date3.isBetween(date1, date2))
        XCTAssertTrue(date1.isBetween(date1, date2, includeBounds: true))
        XCTAssertFalse(date1.isBetween(date1, date2))
    }
    
    func test_random_range() {
        var sinceDate = Date(timeIntervalSinceReferenceDate: 0)
        var toDate = Date(timeIntervalSinceReferenceDate: 10000)
        XCTAssertTrue(Date.random(in: sinceDate..<toDate).isBetween(sinceDate, toDate))
        
        sinceDate = Date(timeIntervalSinceReferenceDate: -10000)
        toDate = Date(timeIntervalSinceReferenceDate: -10)
        XCTAssertTrue(Date.random(in: sinceDate..<toDate).isBetween(sinceDate, toDate))
        
        sinceDate = Date(timeIntervalSinceReferenceDate: -1000)
        toDate = Date(timeIntervalSinceReferenceDate: 10000)
        XCTAssertTrue(Date.random(in: sinceDate..<toDate).isBetween(sinceDate, toDate))
        
        sinceDate = Date.distantPast
        toDate = Date.distantFuture
        XCTAssertTrue(Date.random(in: sinceDate..<toDate).isBetween(sinceDate, toDate))
    }
    
    func test_random_closed_range() {
        var sinceDate = Date(timeIntervalSinceReferenceDate: 0)
        var toDate = Date(timeIntervalSinceReferenceDate: 10000)
        XCTAssertTrue(Date.random(in: sinceDate...toDate).isBetween(sinceDate, toDate, includeBounds: true))
        
        sinceDate = Date(timeIntervalSinceReferenceDate: -10000)
        toDate = Date(timeIntervalSinceReferenceDate: -10)
        XCTAssertTrue(Date.random(in: sinceDate...toDate).isBetween(sinceDate, toDate, includeBounds: true))
        
        sinceDate = Date(timeIntervalSinceReferenceDate: -1000)
        toDate = Date(timeIntervalSinceReferenceDate: 10000)
        XCTAssertTrue(Date.random(in: sinceDate...toDate).isBetween(sinceDate, toDate, includeBounds: true))
        
        sinceDate = Date.distantPast
        toDate = Date.distantFuture
        XCTAssertTrue(Date.random(in: sinceDate...toDate).isBetween(sinceDate, toDate, includeBounds: true))
        
        let singleDate = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertFalse(Date.random(in: singleDate...singleDate).isBetween(singleDate, singleDate, includeBounds: false))
        XCTAssertTrue(Date.random(in: singleDate...singleDate).isBetween(singleDate, singleDate, includeBounds: true))
    }
    
    func test_random_range_using_generator() {
        var generator = SystemRandomNumberGenerator()
        let sinceDate = Date.distantPast
        let toDate = Date.distantFuture
        XCTAssertTrue(Date.random(in: sinceDate..<toDate, using: &generator).isBetween(sinceDate, toDate))
    }
    
    func test_random_closed_range_using_generator() {
        var generator = SystemRandomNumberGenerator()
        let sinceDate = Date.distantPast
        let toDate = Date.distantFuture
        XCTAssertTrue(Date.random(in: sinceDate...toDate, using: &generator).isBetween(sinceDate, toDate, includeBounds: true))
        
        let singleDate = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertFalse(Date.random(in: singleDate...singleDate, using: &generator).isBetween(singleDate, singleDate, includeBounds: false))
        XCTAssertTrue(Date.random(in: singleDate...singleDate, using: &generator).isBetween(singleDate, singleDate, includeBounds: true))
    }
}
