//
//  HomeCoordinatorView.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

struct HomeCoordinatorView: View {
    private let factory: HomeCoordinatorFactory
    @ObservedObject private var coordinator: HomeCoordinator

    init(_ coordinator: HomeCoordinator, factory: HomeCoordinatorFactory) {
        self.coordinator = coordinator
        self.factory = factory
    }

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            factory.makeHomeView(coordinator: coordinator)
                .navigationDestination(for: HomeCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
        switch screen {
        case let .cryptoDetail(crypto):
            factory.makeCryptoDetailView(coordinator: CryptoDetailCoordinator(), crypto: crypto)
        }
    }
}
