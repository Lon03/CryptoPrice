//
//  ExchangeRateRepository.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

protocol ExchangeRateRepository {
    func fetchExchangeRate() async throws -> ExchangeRateResponse
}
