//
//  AppFactory.swift
//  CryptoPrice
//
//  Created by Mike on 11.02.2025.
//

import Foundation

@MainActor
final class AppFactory {
    lazy var networkService = NetworkService()
    lazy var exchangeRateRepository = ExchangeRateRepositoryImplementation(networkService: networkService)
    lazy var cryptoCurrencyRepository = CryptoCurrencyRepositoryImplementation(networkService: networkService)
    lazy var currencyManager = CurrencyManager(exchangeRateRepository: exchangeRateRepository)
}
