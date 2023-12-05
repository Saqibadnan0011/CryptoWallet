<h1>CryptoWallet: IOS Cryptocurrency App</h1>
<p>Project assign by CodeAlpha Company (Internship)</p>

![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen.svg)

<img align="center" width="339" alt="logo" src="https://github.com/Saqibadnan0011/techLord.github.io/assets/79377722/eb0a24c3-a929-47ad-8d5d-7e9ba99ebca2">
 
<p>CryptoWallet, is a swift library and IOS app to watch prices and check your realtime account balance across multiple cryptocurrencies exchange.Show the different type of coins and their graph according to the current market prices and currencies.Working on more effectable functionalities.</p>

<h2>Table of Content</h2>






<h4>Light and Dark mode Preferences</h4>

<img width="304" alt="1st" src="https://github.com/Saqibadnan0011/techLord.github.io/assets/79377722/44959c5e-6ce6-4a4d-b78a-e484b6d764b8">
<img width="304" alt="3rd" src="https://github.com/Saqibadnan0011/techLord.github.io/assets/79377722/7e8e2c50-a38b-4a3a-8aeb-8a604451f869">

<h2>Requirements</h2>
<p>
 <ul>
  <li>IOS 16.0</li>
  <li>XCode</li>
 </ul>
</p>

<h2>Features</h2>
<p>
 <ul>
  <li>Live prices according to the current market</li>
  <li>Show the percentage between Market Cap and DTC Dominance</li>
  <li>Holding your coin to explore the more ups and downs during the market graph</li>
  <li>Customize your holdings coins inside your account</li>
 </ul>
</p>

<h2>Services</h2>

<h4>Fetching the coin data from API</h4>

```swift

import Combine

func getCoin() {
     guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?       vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }

```

<h4>Use CoreData for Setup the portfolio</h4>

```swift

import CoreData

init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading CoreData! \(error)")
            }
            self.getPortfolio()
        }
    }

```

<h2>Extensions</h2>
<h4>UIApplication extension</h4>

```swift

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

```

<h4>Date Extension to fetch and implement to current cryptocurrencies graphs</h4>

```swift

extension Date {
    
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

```

<h2>API Integration</h2>
<p>Use coinGecko API which is super conviniate and easy to use. And it's free</p>

[cionGecko](https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h)


<h2>Feeback</h2>
<h5>Give a 🌟it will be appreciated.</h5>

<h2>Now you can</h2>
<a href="https://www.buymeacoffee.com/saqibadnan3" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>


 
