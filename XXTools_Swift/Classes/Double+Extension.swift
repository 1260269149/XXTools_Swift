//
//  Double+Extension.swift
//  Calculator
//
//  Created by wangxu on 1/1/25.
//  Copyright © 2025 wangxu. All rights reserved.
//

import Foundation

extension Double{
    
    
    /// 最大保留的小数位数
    /// - Parameter maxFractionDigits: <#maxFractionDigits description#>
    /// - Returns: <#description#>
    func formatNumber(maxFractionDigits: Int) -> String{
        
        let multiplier = pow(10.0, Double(maxFractionDigits))
        let roundedNumber = (self * multiplier).rounded() / multiplier
        let stringNumber = String(roundedNumber)
        
        if let dotIndex = stringNumber.lastIndex(of: ".") {
            let fractionPart = String(stringNumber.suffix(from: dotIndex))
            let nonZeroFractionPart = fractionPart.replacingOccurrences(of: "0+", with: "", options:.regularExpression)
            if nonZeroFractionPart == "." {
                return String(stringNumber.prefix(upTo: dotIndex))
            }
            return String(stringNumber.prefix(upTo: dotIndex)) + nonZeroFractionPart
        }
        return stringNumber
        
    }
}
