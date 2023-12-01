//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by apple on 02/12/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCons: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCons.append(DeveloperPreview.instance.coin)
        }
    }
}
