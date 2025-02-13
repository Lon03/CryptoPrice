//
//  ExchangeRateRepositoryImplementation.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class ExchangeRateRepositoryImplementation {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension ExchangeRateRepositoryImplementation: ExchangeRateRepository {
    func fetchExchangeRate() async throws -> ExchangeRateResponse {
        try await networkService.request(with: ExchangeRateConfig.usd)
    }
}
