//
//  Statistics.swift
//  CryptoWallet
//
//  Created by apple on 03/12/2023.
//

import Foundation

struct Statistics: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
