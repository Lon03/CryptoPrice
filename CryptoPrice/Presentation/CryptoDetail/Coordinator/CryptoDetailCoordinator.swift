//
//  CryptoDetailCoordinator.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import Foundation

final class CryptoDetailCoordinator: Coordinator {
    enum Screen: Routable {}

    @Published var navigationPath = [Screen]()
}

extension CryptoDetailCoordinator: CryptoDetailCoordinatorProtocol {}
