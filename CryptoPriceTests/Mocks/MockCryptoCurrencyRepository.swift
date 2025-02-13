//
//  MockCryptoCurrencyRepository.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import Foundation

final class MockCryptoCurrencyRepository: CryptoCurrencyRepository {
    var mockCryptos: [CryptoCurrency]?
    var error: Error?
    var fetchCallCount = 0

    func fetchCryptocurrencies() async throws -> [CryptoCurrency] {
        fetchCallCount += 1
        if let error {
            throw error
        }
        return mockCryptos ?? []
    }
}
