//
//  CryptoDetailViewModel.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import Foundation

final class CryptoDetailViewModel: ViewModel {
    @Published private(set) var state: CryptoDetailViewState

    private let coordinator: CryptoDetailCoordinatorProtocol
    private let currencyManager: CurrencyManagerProtocol

    init(
        coordinator: CryptoDetailCoordinatorProtocol,
        crypto: CryptoCurrency,
        currencyManager: CurrencyManagerProtocol
    ) {
        self.coordinator = coordinator
        self.currencyManager = currencyManager
        state = .init(crypto: crypto)
    }

    func formatPrice(_ price: Double) -> String {
        currencyManager.format(price, includeSymbol: true)
    }
}
