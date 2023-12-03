//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by apple on 02/12/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistics] = [
        Statistics(title: "title", value: "value", percentageChange: 1),
        Statistics(title: "title", value: "value"),
        Statistics(title: "title", value: "value"),
        Statistics(title: "title", value: "value", percentageChange: -5)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = "" 
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        //updated coins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map { (marketDataModel) -> [Statistics] in
                
                var stats: [Statistics] = []
                
                guard let data = marketDataModel else {
                    return stats
                }
                
                let marketCap = Statistics(title: "Market  Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                let volume = Statistics(title: "24h Volume", value: data.volume)
                let btcDominance = Statistics(title: "DTC Dominance", value: data.btcDominance)
                let portfolio = Statistics(title: "Portfolio Value", value: "", percentageChange: 0)
                
                stats.append(contentsOf: [
                    marketCap,
                    volume,
                    btcDominance,
                    portfolio
                ])
                return stats
            }
    }
    
    private func filterCoins(text: String, coin: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coin
        }
        let lowercasedText = text.lowercased()
        
        return coin.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
    
