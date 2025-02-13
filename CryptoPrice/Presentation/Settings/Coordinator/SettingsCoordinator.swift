//
//  SettingsCoordinator.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class SettingsCoordinator: Coordinator {
    enum Screen: Routable {}

    @Published var navigationPath = [Screen]()
}

extension SettingsCoordinator: SettingsCoordinatorProtocol {}
