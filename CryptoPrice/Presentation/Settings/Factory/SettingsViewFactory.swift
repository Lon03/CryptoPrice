//
//  SettingsViewFactory.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

extension ScreenFactory: SettingsViewFactory {
    func makeSettingsView(coordinator: SettingsCoordinatorProtocol) -> SettingsView {
        let viewModel = SettingsViewModel(
            coordinator: coordinator
        )
        let view = SettingsView(viewModel: viewModel)

        return view
    }
}
