//
//  HomeCoordinatorProtocol.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

@MainActor
protocol HomeCoordinatorProtocol {
    func cryptoDetail(crypto: CryptoCurrency)
}
