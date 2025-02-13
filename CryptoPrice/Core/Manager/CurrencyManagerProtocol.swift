//
//  CurrencyManagerProtocol.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import Foundation

protocol CurrencyManagerProtocol {
    func format(_ price: Double, includeSymbol: Bool) -> String
    func shouldUpdateRates() -> Bool
    func updateExchangeRates() async throws
}
