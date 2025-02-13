//
//  SettingsCoordinatorView.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

struct SettingsCoordinatorView: View {
    private let factory: SettingsCoordinatorFactory
    @ObservedObject private var coordinator: SettingsCoordinator

    init(_ coordinator: SettingsCoordinator, factory: SettingsCoordinatorFactory) {
        self.coordinator = coordinator
        self.factory = factory
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeSettingsView(coordinator: coordinator)
                .navigationDestination(for: SettingsCoordinator.Screen.self) { _ in }
        }
    }
}
