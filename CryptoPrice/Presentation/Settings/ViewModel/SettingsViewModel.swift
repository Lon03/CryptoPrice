//
//  SettingsViewModel.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation
import SwiftUI

final class SettingsViewModel: ViewModel {
    @AppStorage(.currency) var currency
    @Published private(set) var state: SettingsViewState

    private let coordinator: SettingsCoordinatorProtocol

    init(
        coordinator: SettingsCoordinatorProtocol,
        userDefaults: UserDefaults = .standard
    ) {
        state = .init()
        self.coordinator = coordinator
        _currency = AppStorage(.currency, store: userDefaults)
        state.selectedCurrency = Currency(rawValue: currency) ?? .usd
    }

    @MainActor
    func handle(_ event: SettingsViewEvent) {
        switch event {
        case let .onUpdateCurrency(value):
            state.selectedCurrency = value
            currency = value.name
        }
    }
}
