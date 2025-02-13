//
//  CryptoPrice.swift
//  CryptoPrice
//
//  Created by Mike on 11.02.2025.
//

import SwiftUI

@main
struct CryptoPrice: App {
    private let appFactory = AppFactory()

    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(factory: ScreenFactory(appFactory: appFactory))
                .preferredColorScheme(.light)
        }
    }
}
