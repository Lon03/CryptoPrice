//
//  MockCurrencyManager.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import Foundation

final class MockCurrencyManager {
    private let exchangeRateRepository: ExchangeRateRepository
    var formatCallCount = 0
    var lastFormattedPrice: Double?
    var mockFormattedString: String?
    var shouldUpdateRatesReturnValue = true
    var fetchCallCount = 0

    init(exchangeRateRepository: ExchangeRateRepository = MockExchangeRateRepository()) {
        self.exchangeRateRepository = exchangeRateRepository
    }
}

// MARK: - CurrencyManager Interface

extension MockCurrencyManager: CurrencyManagerProtocol {
    func format(_ price: Double, includeSymbol _: Bool) -> String {
        formatCallCount += 1
        lastFormattedPrice = price
        return mockFormattedString ?? "$\(price)"
    }

    func shouldUpdateRates() -> Bool {
        shouldUpdateRatesReturnValue
    }

    @MainActor
    func updateExchangeRates() async throws {}
}
