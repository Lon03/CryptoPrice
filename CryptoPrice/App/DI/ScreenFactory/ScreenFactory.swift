//
//  ScreenFactory.swift
//  CryptoPrice
//
//  Created by Mike on 11.02.2025.
//

import SwiftUI

final class ScreenFactory: RootCoordinatorFactory {
    let appFactory: AppFactory

    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}
