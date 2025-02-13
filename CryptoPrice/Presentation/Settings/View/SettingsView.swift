//
//  SettingsView.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: SettingsViewModel

    init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List {
            Section(L10n.Settings.Currency.title) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Button {
                        viewModel.handle(.onUpdateCurrency(currency))
                    } label: {
                        HStack {
                            Text(currency.rawValue)
                            Spacer()
                            if currency == viewModel.state.selectedCurrency {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(L10n.Settings.title)
    }
}
