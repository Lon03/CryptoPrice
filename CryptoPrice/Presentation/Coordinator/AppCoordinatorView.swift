//
//  AppCoordinatorView.swift
//  CryptoPrice
//
//  Created by Mike on 11.02.2025.
//

import SwiftUI

struct RootCoordinatorView: View {
    @State private var selectedTab: TabBarItem = .home

    private let factory: ScreenFactory
    @StateObject private var homeCoordinator: HomeCoordinator
    @StateObject private var settingsCoordinator: SettingsCoordinator

    @State private var isShowCreateEventScreen = false
    @State private var showTabBar = true

    init(factory: ScreenFactory) {
        self.factory = factory
        let homeCoordinator = HomeCoordinator()
        let settingsCoordinator = SettingsCoordinator()

        _homeCoordinator = StateObject(wrappedValue: homeCoordinator)
        _settingsCoordinator = StateObject(wrappedValue: settingsCoordinator)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeCoordinatorView(homeCoordinator, factory: factory)
                .tabItem {
                    Label(TabBarItem.home.title, systemImage: TabBarItem.home.image)
                }
                .tag(TabBarItem.home)

            SettingsCoordinatorView(settingsCoordinator, factory: factory)
                .tabItem {
                    Label(TabBarItem.settings.title, systemImage: TabBarItem.settings.image)
                }
                .tag(TabBarItem.settings)
        }
    }
}
