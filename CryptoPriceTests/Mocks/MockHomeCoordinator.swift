//
//  MockHomeCoordinator.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import Foundation

final class MockHomeCoordinator: HomeCoordinatorProtocol {
    var navigatedToCrypto: CryptoCurrency?

    func cryptoDetail(crypto: CryptoCurrency) {
        navigatedToCrypto = crypto
    }
}
