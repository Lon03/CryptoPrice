//
//  HomeViewState.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum HomeViewEvent {
    case onCryptoCurrencyTap(crypto: CryptoCurrency)
}

struct HomeViewState {
    enum State {
        case loaded
        case loading
        case error(String)
    }

    var currentState: State = .loading
    var cryptocurrencies: [CryptoCurrency] = []
}

// MARK: - Equatable Conformance

extension HomeViewState.State: Equatable {
    static func == (lhs: HomeViewState.State, rhs: HomeViewState.State) -> Bool {
        switch (lhs, rhs) {
        case (.loaded, .loaded):
            true
        case (.loading, .loading):
            true
        case let (.error(lhsError), .error(rhsError)):
            lhsError == rhsError
        default:
            false
        }
    }
}

extension HomeViewState: Equatable {
    static func == (lhs: HomeViewState, rhs: HomeViewState) -> Bool {
        lhs.currentState == rhs.currentState &&
            lhs.cryptocurrencies == rhs.cryptocurrencies
    }
}
