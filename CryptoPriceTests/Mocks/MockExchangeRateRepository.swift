//
//  MockExchangeRateRepository.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import Foundation

final class MockExchangeRateRepository: ExchangeRateRepository {
    var mockResponse: ExchangeRateResponse?
    var error: Error?

    func fetchExchangeRate() async throws -> ExchangeRateResponse {
        if let error {
            throw error
        }
        return mockResponse ?? ExchangeRateResponse(rates: [:])
    }
}
