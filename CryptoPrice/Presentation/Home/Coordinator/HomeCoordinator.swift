//
//  HomeCoordinator.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

final class HomeCoordinator: Coordinator {
    enum Screen: Routable {
        case cryptoDetail(crypto: CryptoCurrency)
    }

    @Published var navigationPath = [Screen]()
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func cryptoDetail(crypto: CryptoCurrency) {
        navigationPath.append(.cryptoDetail(crypto: crypto))
    }
}
