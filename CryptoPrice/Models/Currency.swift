//
//  Currency.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum Currency: String, CaseIterable {
    case usd = "USD"
    case sek = "SEK"

    var symbol: String {
        switch self {
        case .usd: "$"
        case .sek: "kr"
        }
    }

    var name: String {
        rawValue
    }
}
