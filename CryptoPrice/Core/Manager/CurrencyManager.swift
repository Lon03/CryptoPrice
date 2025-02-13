//
//  CurrencyManager.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import Foundation
import SwiftUI

final class CurrencyManager: ObservableObject, CurrencyManagerProtocol {
    @AppStorage(.currency) var currency
    private let exchangeRateRepository: ExchangeRateRepository
    private var exchangeRates: [String: Double] = [:]
    private var lastUpdatedCurrency: String?

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        return formatter
    }()

    init(exchangeRateRepository: ExchangeRateRepository, userDefaults: UserDefaults = .standard) {
        self.exchangeRateRepository = exchangeRateRepository
        _currency = AppStorage(.currency, store: userDefaults)
    }

    /// Updates exchange rates from the remote repository
    /// - Throws: Network or parsing errors from repository
    /// - Note: Must be called on the main actor as it updates published state
    @MainActor
    func updateExchangeRates() async throws {
        // Fetch latest exchange rates from repository
        let result = try await exchangeRateRepository.fetchExchangeRate()
        // Update local exchange rates cache
        exchangeRates = result.rates
        // Store current currency as last updated
        lastUpdatedCurrency = currency
    }

    /// Determines if exchange rates need to be updated based on currency changes
    /// - Returns: True if rates should be updated (currency changed or no previous update), false otherwise
    func shouldUpdateRates() -> Bool {
        // If no previous update, rates should be fetched
        guard let lastUpdatedCurrency else {
            return true
        }
        // Check if currency has changed since last update
        return lastUpdatedCurrency != currency
    }

    /// Formats a price value according to cryptocurrency display standards
    /// - Parameters:
    ///   - price: The price to format
    ///   - includeSymbol: Whether to include the currency symbol (e.g., $)
    /// - Returns: Formatted price string
    func format(_ price: Double, includeSymbol: Bool) -> String {
        let convertedPrice = convert(price)

        configurePrecision(for: convertedPrice)

        guard let formattedPrice = numberFormatter.string(from: NSNumber(value: convertedPrice)) else {
            return "\(convertedPrice)"
        }

        if includeSymbol, let currencyType = Currency(rawValue: currency) {
            return "\(currencyType.symbol)\(formattedPrice)"
        }

        return formattedPrice
    }

    /// Configures number formatter precision based on price value
    /// - Parameter price: The price value to determine precision for
    private func configurePrecision(for price: Double) {
        switch price {
        case _ where price >= 10000:
            numberFormatter.maximumFractionDigits = 0

        case _ where price >= 1.0:
            numberFormatter.maximumFractionDigits = 2

        default:
            numberFormatter.maximumFractionDigits = 5
        }
    }

    /// Converts price to selected currency using current exchange rate
    private func convert(_ price: Double) -> Double {
        let rate = exchangeRates[currency] ?? 1.0
        return price * rate
    }
}
