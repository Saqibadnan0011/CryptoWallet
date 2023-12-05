//
//  Double.swift
//  CryptoWallet
//
//  Created by apple on 01/12/2023.
//

import Foundation

extension Double {
    
    ///Convert Double into a currency with 2 decimal places
    /// ```
    /// Convert 4567.89 to $4,567.89
    /// ```

    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    ///Convert Double into a currency as a String with 2 decimal places
    /// ```
    /// Convert 4567.89 to "$4,567.89"
    /// ```
    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }

    ///Convert Double into a currency with 2-6 decimal places
    /// ```
    /// Convert 4567.89 to $4,567.89
    /// Convert 45.6789 to $45,6789
    /// Convert 0.456789 to $0.456789
    /// ```

    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current
        //formatter.currencyCode = "usd"
        //formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    ///Convert Double into a currency as a String with 2-6 decimal places
    /// ```
    /// Convert 4567.89 to "$4,567.89"
    /// Convert 45.6789 to "$45,6789"
    /// Convert 0.456789 to "$0.456789"
    /// ```
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    ///Convert Double into a String presentation
    /// ```
    /// Convert 4.56789 to "4.56"
    /// ```
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Convert Double into a String presentation percent symbol
    /// ```
    /// Convert 4.56789 to "4.56%"
    /// ```
    
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
