//
//  String+Extension.swift
//  Calculator
//
//  Created by wangxu on 2020/9/30.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit

extension String{
    
    public var isNumberStr: Bool{
        let scan = Scanner.init(string: self)
        var val: Double = 0.0
        return scan.scanDouble(&val) && scan.isAtEnd
    }
    public var isTimeStr: Bool{//不能验证2月30和31
        let timeGex = "([1-9][0-9]{3})-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])"
        let regex = NSPredicate.init(format: "SELF MATCHES %@", timeGex)
        return regex.evaluate(with: self)
    }
    //类型转换
    /// String: 转化为Int
    public var int: Int? {
      guard let num = NumberFormatter().number(from: self) else { return nil }
      return num.intValue
    }

    /// String: 转化为 Double
    public var double: Double? {
        if self.isNumberStr{
            guard let num = NumberFormatter().number(from: self) else{ return nil }
            return num.doubleValue
        }else{
            return nil
        }
    }

    /// String: 转化为Float
    public var float: Float? {
      guard let num = NumberFormatter().number(from: self) else{ return nil }
      return num.floatValue
    }

    /// String: 转化为 NSNumber
    public var number: NSNumber? {
      guard let num = NumberFormatter().number(from: self) else{ return nil }
      return num
    }

    /// String: 转化为 Bool
    public var bool: Bool? {
      if let num = NumberFormatter().number(from: self) {
        return num.boolValue
      }
      switch self.lowercased() {
      case "true","yes": return true
      case "false","no": return false
      default: return nil
      }
    }
    
    public func toImage() -> UIImage? {
        return UIImage(named: self)
    }
    public func toColor() -> UIColor? {
        return UIColor.hexString(self)
    }
    public func toNoti() -> NSNotification.Name {
        let noti = NSNotification.Name.init(self)
        return noti
    }
    
}
