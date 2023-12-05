//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by apple on 02/12/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistics] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var sortOption: SortOption = .holdings
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // Updated coins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // Update portfolioData
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coin: returnedCoins)
            }
            .store(in: &cancellables)
        
        // Update marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    
    // Updated Portfolio with Portfolio services
     func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    // Reloading the data func
    func reloadData() {
        isLoading = true
        coinDataService.getCoin()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    private func filterAndSortCoins(text: String, coin: [CoinModel], sort: SortOption) -> [CoinModel] {
        var updatedCoins = filterCoins(text: text, coin: coin)
        sortCoins(sort: sort, coin: &updatedCoins)
        return updatedCoins
    }
    
    // Filter the coins in map properties
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
    
    // Sorting the coins
    private func sortCoins(sort: SortOption, coin: inout [CoinModel]) {
        switch sort {
        case .rank, .holdings:
            coin.sort(by: { $0.rank < $1.rank})
        case .rankReversed, .holdingsReversed:
            coin.sort(by: { $0.rank > $1.rank})
        case .price:
            coin.sort(by: { $0.currentPrice > $1.currentPrice})
        case .priceReversed:
            coin.sort(by: { $0.currentPrice < $1.currentPrice})
        }
    }
    
    // Sorting the portfolio coins
    // This fucn only sorting by holdings and holdingsReversed if needed
    private func sortPortfolioCoinsIfNeeded(coin: [CoinModel]) -> [CoinModel] {
        switch sortOption {
        case .holdings:
            return coin.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue})
        case .holdingsReversed:
            return coin.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue})
        default:
            return coin
        }
    }
    
    // Mapping the all coins to portfolio coins
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id}) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    // Globalize the MarketData in map properties
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [Statistics] {
        var stats: [Statistics] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = Statistics(title: "Market  Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistics(title: "24h Volume", value: data.volume)
        let btcDominance = Statistics(title: "DTC Dominance", value: data.btcDominance)
        
        let portfolioValue =
         portfolioCoins
            .map ({ $0.currentHoldingsValue })
            .reduce(0, +)
        let previousValue =
         portfolioCoins
            .map { (coin) -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = (coin.priceChangePercentage24H ?? 5) / 100
                let previousValue = currentValue / {1 + percentChange}()
                return previousValue
            }
            .reduce(0, +)
        
        let percentageChange =  ((portfolioValue - previousValue) / previousValue) * 100
        
        let portfolio = Statistics(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
    
