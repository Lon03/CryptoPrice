//
//  CryptoDetailView.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import SwiftUI

struct CryptoDetailView: View {
    @StateObject private var viewModel: CryptoDetailViewModel

    init(viewModel: CryptoDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header with price and change
                headerSection
                    .padding()

                // Stats grid
                statsGridView
                    .padding()
            }
        }
        .navigationTitle(viewModel.state.crypto.name)
        .navigationBarTitleDisplayMode(.large)
    }

    // MARK: - Views

    private var headerSection: some View {
        VStack(spacing: 8) {
            Text(viewModel.formatPrice(viewModel.state.crypto.lastPrice))
                .font(.system(size: 34, weight: .bold))

            HStack(spacing: 4) {
                Image(systemName: viewModel.state.crypto.priceChangePercent >= 0 ?
                    "arrow.up.right" : "arrow.down.right")
                Text(String(format: viewModel.state.crypto.priceChangePercent.percentFormatted))
            }
            .font(.headline)
            .foregroundColor(viewModel.state.crypto.priceChangePercent >= 0 ? .green : .red)
        }
    }

    private var statsGridView: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ], spacing: 16) {
            DetailRow(title: L10n.Crypto.Detail.high, value: viewModel.formatPrice(viewModel.state.crypto.highPrice))
            DetailRow(title: L10n.Crypto.Detail.low, value: viewModel.formatPrice(viewModel.state.crypto.lowPrice))
            DetailRow(title: L10n.Crypto.Detail.open, value: viewModel.formatPrice(viewModel.state.crypto.openPrice))
            DetailRow(title: L10n.Crypto.Detail.volume, value: viewModel.state.crypto.volume.volumeFormatted)
        }
    }
}
