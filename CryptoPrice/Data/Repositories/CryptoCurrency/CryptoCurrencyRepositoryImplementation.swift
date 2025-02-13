//
//  CryptoCurrencyRepositoryImplementation.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class CryptoCurrencyRepositoryImplementation {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension CryptoCurrencyRepositoryImplementation: CryptoCurrencyRepository {
    func fetchCryptocurrencies() async throws -> [CryptoCurrency] {
        try await networkService.request(with: CryptoCurrencyConfig.tickers)
    }
}
