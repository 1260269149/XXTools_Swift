//
//  Date+Extension.swift
//  Calendar
//
//  Created by wangxu on 2023/3/30.
//

import UIKit

extension Date{
    
    public static var currentComponets: DateComponents{
        return Calendar.current.dateComponents([.year, .month, .day, .weekday, .hour, .minute, .second], from: Date())
    }
    public static var currentYear: Int{
        return Calendar.current.component(.year, from: Date())
    }
    public static var currentMonth: Int{
        return Calendar.current.component(.month, from: Date())
    }
    public static var currentDay: Int{
        return Calendar.current.component(.day, from: Date())
    }
    public static var currentHour: Int{
        return Calendar.current.component(.hour, from: Date())
    }
    public static var currentMinute: Int{
        return Calendar.current.component(.minute, from: Date())
    }
    public static var currentSecond: Int{
        return Calendar.current.component(.second, from: Date())
    }
    public static func dateWithyyyyMMdd(str: String) -> Date? {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd"
        let tempDate = dateFmt.date(from: str) ?? Date()
        let interval = Int(tempDate.timeIntervalSince1970) + 8*60*60
        let date = Date.init(timeIntervalSince1970: TimeInterval(interval))
//        print(date.toyyyy_MM_dd_HH_mm_ss)
        return date
        
    }
    public static func dateWithyyyyMMddHHmmss(str: String) -> Date? {
        let dateFmt = DateFormatter()
        dateFmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let tempDate = dateFmt.date(from: str) ?? Date()
        let interval = Int(tempDate.timeIntervalSince1970) + 8*60*60
        let date = Date.init(timeIntervalSince1970: TimeInterval(interval))
//        print(date.toyyyy_MM_dd_HH_mm_ss)
        return date
    }
    public static func dateWith(year: Int, month: Int, day: Int) -> Date?{
        let monthStr = month < 10 ? "0\(month)" : "\(month)"
        let dayStr = day < 10 ? "0\(day)" : "\(day)"
        let time = "\(year)-\(monthStr)-\(dayStr)"
        return dateWithyyyyMMdd(str: time)
    }
    public static func dateWith(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date?{
        let monthStr = month < 10 ? "0\(month)" : "\(month)"
        let dayStr = day < 10 ? "0\(day)" : "\(day)"
        let hourStr = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteStr = minute < 10 ? "0\(minute)" : "\(minute)"
        let secondStr = second < 10 ? "0\(second)" : "\(second)"
        let time = "\(year)-\(monthStr)-\(dayStr) \(hourStr):\(minuteStr):\(secondStr)"
        return dateWithyyyyMMddHHmmss(str: time)
    }
    public static func dateWith(_ dateString: String?, withFormat format: String) -> Date? {
        if dateString == nil {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString!)
    }
}
extension Date{
    
    
    public func getWeekDay()->Int{
//        let dateFmt = NSDateFormatter()
//        dateFmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let date = dateFmt.dateFromString(dateTime)
        let interval = Int(self.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
        let days = Int(interval/(24*60*60))
        let weekday = ((days + 4)%7+7)%7
        
        return weekday == 0 ? 7 : weekday
    }
    public func getWeekDayChinese()->String{
        var arr = ["一", "二", "三", "四", "五", "六", "日"]
        return arr[getWeekDay()-1]
    }
    public func getFirstDayWeekDay() -> Int{
        let year = self.year() ?? 1
        let month = self.month() ?? 1
        let date = Date.dateWith(year: year, month: month, day: 1)
        
        let interval = Int(date!.timeIntervalSince1970)
        let days = Int(interval/(24*60*60))
        let weekday = ((days + 4)%7+7)%7
        
        return weekday == 0 ? 7 : weekday
    }
    public func getComponets()->DateComponents{
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: self)
    }
    public func year() -> Int?{
        self.getComponets().year
    }
    public func month() -> Int?{
        self.getComponets().month
    }
    public func day() -> Int?{
        self.getComponets().day
    }
    public func hour() -> Int?{
        self.getComponets().hour
    }
    public func minute() -> Int?{
        self.getComponets().minute
    }
    public func weekDay() -> Int?{//星期天是1 星期一是2...
        self.getComponets().weekday
    }
    //获取某月的天数
    public func getMonthDaysCount() -> Int{
        var count = 0
//        let year = Calendar.current.component(.year, from: self)
        let month = Calendar.current.component(.month, from: self)
        if month == 2{
            count = self.isLeapYear() ? 29 : 28
        }else if month == 4 || month == 6 || month == 9 || month == 11{
            count = 30
        }else{
            count = 31
        }
        return count
    }
    //判断某年是不是闰月
    public func isLeapYear() -> Bool{
        let year = Calendar.current.component(.year, from: self)
        if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0{
            return true
        }else{
            return false
        }
    }
    
    public func toStringWithFormat(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    public var toyyyy_MM_dd_HH_mm_ss: String {
        return toStringWithFormat("yyyy-MM-dd HH:mm:ss")
    }
    public var toyyyyMMddHHmmss: String {
        return toStringWithFormat("yyyyMMddHHmmss")
    }
    public var toyyyy_MM_dd: String{
        return toStringWithFormat("yyyy-MM-dd")
    }
    public var toyyyy_MM_dd_HH: String{
        return toStringWithFormat("yyyy-MM-dd HH")
    }
    public var toyyyy_MM_dd_HH_mm: String {
        return toStringWithFormat("yyyy-MM-dd HH:mm")
    }
    //下个月的这一天
    public func getDateWithAfterMonth() -> Date?{
        var year = self.year()!
        var month = self.month()!
        if month == 12{
            year += 1
            month = 1
        }else{
            month += 1
        }
        let tempD = Date.dateWith(year: year, month: month, day: 1)
        let daysCount = tempD?.getMonthDaysCount() ?? 0
        
        if self.day()! > daysCount{
            print("目标月份天数不够")
            return nil
        }
        
        var interval = self.timeIntervalSince1970
        interval = interval + Double(daysCount) * 24 * 60 * 60
        let date = Date.init(timeIntervalSince1970: interval)
        return date
    }
    //上个月的这一天
    public func getDateWithBeforeMonth() -> Date?{
        
        var year = self.year()!
        var month = self.month()!
        if month == 1{
            year -= 1
            month = 12
        }else{
            month -= 1
        }
        let tempD = Date.dateWith(year: year, month: month, day: 1)
        let daysCount = tempD?.getMonthDaysCount() ?? 0
        
        if self.day()! > daysCount{
            print("目标月份天数不够")
            return nil
        }
        
        var interval = self.timeIntervalSince1970
        interval = interval - Double(daysCount) * 24 * 60 * 60
        let date = Date.init(timeIntervalSince1970: interval)
        return date
    }
    //下个月的 (第一天)
    public func getDateWithAfterMonthFirstDay() -> Date{
        var year = self.year()!
        var month = self.month()!
        if month == 12{
            year += 1
            month = 1
        }else{
            month += 1
        }
        let date = Date.dateWith(year: year, month: month, day: 1)
        
        return date!
    }
    //上个月的 (第一天)
    public func getDateWithBeforeMonthFirstDay() -> Date{
        
        var year = self.year()!
        var month = self.month()!
        if month == 1{
            year -= 1
            month = 12
        }else{
            month -= 1
        }
        let date = Date.dateWith(year: year, month: month, day: 1)
        return date!
    }
    public func getDateWithAfterDay(day: Int) -> Date{
        var interval = self.timeIntervalSince1970
        interval = interval + Double(day)*24*60*60
        let date = Date.init(timeIntervalSince1970: interval)
        return date
    }
    public func getDateWithBeforeDay(day: Int) -> Date{
        var interval = self.timeIntervalSince1970
        interval = interval - Double(day)*24*60*60
        let date = Date.init(timeIntervalSince1970: interval)
        return date
    }
    
    /// 获取时间间隔天数
    /// - Returns: <#description#>
    public func getIntervalDaysCount(targetTime: Date)->Int{
        let start = self.timeIntervalSince1970
        let target = targetTime.timeIntervalSince1970
        let count = ceil((target - start)/(24*60*60))//向上取整
        return Int(count)
    }
}
