//
//  HomeViewFactory.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

extension ScreenFactory: HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> HomeView {
        let viewModel = HomeViewModel(
            coordinator: coordinator,
            cryptoCurrencyRepository: appFactory.cryptoCurrencyRepository,
            currencyManager: appFactory.currencyManager
        )
        let view = HomeView(viewModel: viewModel)

        return view
    }
}
