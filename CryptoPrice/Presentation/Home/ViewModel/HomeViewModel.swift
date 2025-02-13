//
//  HomeViewModel.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class HomeViewModel: ViewModel {
    @Published private(set) var state: HomeViewState

    private let coordinator: HomeCoordinatorProtocol
    private let cryptoCurrencyRepository: CryptoCurrencyRepository
    private let currencyManager: CurrencyManagerProtocol

    init(
        coordinator: HomeCoordinatorProtocol,
        cryptoCurrencyRepository: CryptoCurrencyRepository,
        currencyManager: CurrencyManagerProtocol
    ) {
        state = .init()
        self.coordinator = coordinator
        self.cryptoCurrencyRepository = cryptoCurrencyRepository
        self.currencyManager = currencyManager
    }

    @MainActor
    func handle(_ event: HomeViewEvent) {
        switch event {
        case let .onCryptoCurrencyTap(value):
            coordinator.cryptoDetail(crypto: value)
        }
    }

    func formatPrice(_ price: Double) -> String {
        currencyManager.format(price, includeSymbol: true)
    }

    @MainActor
    func loadData(isRefreshing: Bool = false) async {
        if !isRefreshing {
            guard currencyManager.shouldUpdateRates() else {
                return
            }
            state.currentState = .loading
        }
        await fetchCryptoCurrencies()
        state.currentState = .loaded
    }

    @MainActor
    private func fetchCryptoCurrencies() async {
        do {
            try await currencyManager.updateExchangeRates()
            let allCryptos = try await cryptoCurrencyRepository.fetchCryptocurrencies()
            state.cryptocurrencies = allCryptos.filter { $0.quoteAsset.lowercased() == "usdt" }
        } catch {
            state.currentState = .error(L10n.Home.Error.fetch(error.localizedDescription))
        }
    }
}
