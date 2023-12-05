//
//  MarketDataModel.swift
//  CryptoWallet
//
//  Created by apple on 04/12/2023.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Data:
 {
   "data": {
     "active_cryptocurrencies": 11247,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 939,
     "total_market_cap": {
       "btc": 39322528.92670293,
       "eth": 718148134.6211836,
       "ltc": 21696696801.647552,
       "bch": 6850083418.147236,
       "bnb": 6844395229.8659,
       "eos": 2228326864445.1787,
       "xrp": 2508554441922.274,
       "xlm": 12786369605649.09,
       "link": 98094909791.62984,
       "dot": 284658009647.2546,
       "yfi": 181525569.1191447,
       "usd": 1554743527882.138,
       "aed": 5709197029888.933,
       "ars": 561065295407269.7,
       "aud": 2331459190054.4404,
       "bdt": 171450642302792.22,
       "bhd": 586105660397.4785,
       "bmd": 1554743527882.138,
       "brl": 7654199840191.785,
       "cad": 2099307995958.1343,
       "chf": 1351344205846.9568,
       "clp": 1349970341181107.5,
       "cny": 10995146229182.469,
       "czk": 34693324452925.95,
       "dkk": 10645759599366.223,
       "eur": 1427968185875.1013,
       "gbp": 1223726192847.8083,
       "hkd": 12148688189694.633,
       "huf": 541008769627730.3,
       "idr": 24074948288564684,
       "ils": 5783731434615.585,
       "inr": 129433409279481.06,
       "jpy": 228158640873109.1,
       "krw": 2011835513110359.2,
       "kwd": 480163881664.0632,
       "lkr": 510512994612662.44,
       "mmk": 3265890109722974.5,
       "mxn": 26714380667834.836,
       "myr": 7265316505793.211,
       "ngn": 1227870940085968.2,
       "nok": 16568995061251.623,
       "nzd": 2508729492360.0337,
       "php": 86054280005999.47,
       "pkr": 437983195344181.06,
       "pln": 6186091285913.823,
       "rub": 141831504761687.94,
       "sar": 5832309396144.245,
       "sek": 16136760813065.107,
       "sgd": 2076515455839.381,
       "thb": 54663328755137.37,
       "try": 44950192944176.06,
       "twd": 48599727938067.93,
       "uah": 56713427563694.34,
       "vef": 155676469446.83862,
       "vnd": 37777760524801730,
       "zar": 28970702212673.766,
       "xdr": 1168501702737.4348,
       "xag": 61006223699.555595,
       "xau": 749681781.7094864,
       "bits": 39322528926702.93,
       "sats": 3932252892670293
     },
     "total_volume": {
       "btc": 1406590.3903392574,
       "eth": 25688588.51578744,
       "ltc": 776103827.9147327,
       "bch": 245031582.96223247,
       "bnb": 244828113.0635929,
       "eos": 79708585373.68752,
       "xrp": 89732493508.43782,
       "xlm": 457376092167.32465,
       "link": 3508913623.314918,
       "dot": 10182387344.650875,
       "yfi": 6493278.232429859,
       "usd": 55614106352.04875,
       "aed": 204221394146.9541,
       "ars": 20069641358615.773,
       "aud": 83397690375.19258,
       "bdt": 6132892071365.093,
       "bhd": 20965350198.48892,
       "bmd": 55614106352.04875,
       "brl": 273795308562.64203,
       "cad": 75093503242.91731,
       "chf": 48338390888.54197,
       "clp": 48289246927322.875,
       "cny": 393302960121.6884,
       "czk": 1241000976192.7915,
       "dkk": 380805191299.93744,
       "eur": 51079276505.996376,
       "gbp": 43773418196.84679,
       "hkd": 434565846329.59143,
       "huf": 19352207429641.43,
       "idr": 861175306749249.6,
       "ils": 206887534405.47067,
       "inr": 4629910502977.187,
       "jpy": 8161371114334.623,
       "krw": 71964560187852.4,
       "kwd": 17175749377.554014,
       "lkr": 18261355308657.586,
       "mmk": 116822843535906.12,
       "mxn": 955589382394.0779,
       "myr": 259884718983.12314,
       "ngn": 43921678285775.66,
       "nok": 592682868240.1649,
       "nzd": 89738755167.3468,
       "php": 3078213090760.936,
       "pkr": 15666920986937.19,
       "pln": 221280187058.84845,
       "rub": 5073397797405.454,
       "sar": 208625197158.43982,
       "sek": 577221590533.2318,
       "sgd": 74278200443.79623,
       "thb": 1955339980148.594,
       "try": 1607895299842.682,
       "twd": 1738441350458.6987,
       "uah": 2028673241311.357,
       "vef": 5568640469.030647,
       "vnd": 1351333100212669.8,
       "zar": 1036299354237.4878,
       "xdr": 41798005139.22201,
       "xag": 2182229127.903573,
       "xau": 26816565.94189433,
       "bits": 1406590390339.2573,
       "sats": 140659039033925.75
     },
     "market_cap_percentage": {
       "btc": 49.74268563592695,
       "eth": 16.743175935567976,
       "usdt": 5.7618444024095945,
       "bnb": 2.2475818634186804,
       "xrp": 2.147953740136083,
       "sol": 1.7125944240265054,
       "usdc": 1.576495932910864,
       "steth": 1.293786289605756,
       "ada": 0.8772126471326726,
       "doge": 0.7746928247127202
     },
     "market_cap_change_percentage_24h_usd": 1.106311260160038,
     "updated_at": 1701633165
   }
 }
*/

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
            case totalMarketCap = "total_market_cap"
            case totalVolume = "total_volume"
            case marketCapPercentage = "market_cap_percentage"
            case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { (key, value) -> Bool in
            return key == "usd"
        }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
