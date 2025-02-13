//
//  ExchangeRate.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}
