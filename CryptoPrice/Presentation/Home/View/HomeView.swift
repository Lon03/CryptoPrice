//
//  HomeView.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            switch viewModel.state.currentState {
            case .loading:
                ProgressView()
            case .loaded:
                List(viewModel.state.cryptocurrencies) { crypto in
                    CryptoCurrencyRow(crypto: crypto, price: viewModel.formatPrice(crypto.lastPrice)) {
                        viewModel.handle(.onCryptoCurrencyTap(crypto: crypto))
                    }
                }
                .refreshable {
                    await viewModel.loadData(isRefreshing: true)
                }
            case let .error(error):
                ErrorView(message: error) {
                    Task {
                        await viewModel.loadData()
                    }
                }
            }
        }
        .navigationTitle(L10n.Home.title)
        .task {
            await viewModel.loadData()
        }
    }
}
