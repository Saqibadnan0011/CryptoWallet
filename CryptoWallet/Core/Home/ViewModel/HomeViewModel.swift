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
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        //updated coins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
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
    
