//
//  CryptoCurrency.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

struct CryptoCurrency: Identifiable, Codable, Equatable, Hashable {
    let id: String
    let symbol: String
    let name: String
    let quoteAsset: String
    let lastPrice: Double
    let volume: Double
    let openPrice: Double
    let highPrice: Double
    let lowPrice: Double
    let priceChangePercent: Double

    // Add memberwise initializer for testing
    init(symbol: String, name: String, quoteAsset: String, lastPrice: Double, volume: Double, openPrice: Double, highPrice: Double, lowPrice: Double) {
        self.symbol = symbol
        self.name = name
        self.quoteAsset = quoteAsset
        self.lastPrice = lastPrice
        self.volume = volume
        self.openPrice = openPrice
        self.highPrice = highPrice
        self.lowPrice = lowPrice

        // Calculate price change percent
        if openPrice > 0 {
            priceChangePercent = ((lastPrice - openPrice) / openPrice) * 100
        } else {
            priceChangePercent = 0
        }

        id = symbol
    }

    enum CodingKeys: String, CodingKey {
        case symbol
        case name = "baseAsset"
        case quoteAsset
        case lastPrice
        case volume
        case openPrice
        case highPrice
        case lowPrice
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name).uppercased()
        quoteAsset = try container.decode(String.self, forKey: .quoteAsset)

        // Handle string to double conversion
        lastPrice = try Double(container.decode(String.self, forKey: .lastPrice)) ?? 0
        volume = try Double(container.decode(String.self, forKey: .volume)) ?? 0
        openPrice = try Double(container.decode(String.self, forKey: .openPrice)) ?? 0
        highPrice = try Double(container.decode(String.self, forKey: .highPrice)) ?? 0
        lowPrice = try Double(container.decode(String.self, forKey: .lowPrice)) ?? 0

        // Calculate 24h price change percent
        if openPrice > 0 {
            priceChangePercent = ((lastPrice - openPrice) / openPrice) * 100
        } else {
            priceChangePercent = 0
        }

        id = symbol
    }
}
