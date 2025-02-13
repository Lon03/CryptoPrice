//
//  SettingsViewState.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum SettingsViewEvent {
    case onUpdateCurrency(Currency)
}

struct SettingsViewState: Equatable {
    var selectedCurrency: Currency = .usd
}
