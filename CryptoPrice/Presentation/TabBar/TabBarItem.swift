//
//  TabBarItem.swift
//  CryptoPrice
//
//  Created by Mike on 11.02.2025.
//

import SwiftUI

enum TabBarItem: Identifiable, Hashable, CaseIterable {
    case home, settings

    var id: Self {
        self
    }

    var image: String {
        switch self {
        case .home: "bitcoinsign.circle.fill"
        case .settings: "gear"
        }
    }

    var title: String {
        switch self {
        case .home: L10n.Home.title
        case .settings: L10n.Settings.title
        }
    }
}
