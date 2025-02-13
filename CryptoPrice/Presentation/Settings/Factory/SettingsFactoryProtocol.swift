//
//  SettingsFactoryProtocol.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

@MainActor
protocol SettingsViewFactory {
    func makeSettingsView(coordinator: SettingsCoordinatorProtocol) -> SettingsView
}

protocol SettingsCoordinatorFactory: SettingsViewFactory {}
