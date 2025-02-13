//
//  CryptoDetailCoordinatorFactory.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import SwiftUI

@MainActor
protocol CryptoDetailViewFactory {
    func makeCryptoDetailView(coordinator: CryptoDetailCoordinatorProtocol, crypto: CryptoCurrency) -> CryptoDetailView
}

// MARK: - CryptoDetailViewFactory

extension ScreenFactory: CryptoDetailViewFactory {
    func makeCryptoDetailView(coordinator: CryptoDetailCoordinatorProtocol,
                              crypto: CryptoCurrency) -> CryptoDetailView
    {
        let viewModel = CryptoDetailViewModel(coordinator: coordinator,
                                              crypto: crypto,
                                              currencyManager: appFactory.currencyManager)
        let view = CryptoDetailView(viewModel: viewModel)

        return view
    }
}
