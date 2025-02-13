//
//  ViewModel.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

@MainActor
protocol ViewModel<State>: ObservableObject {
    associatedtype State

    var state: State { get }
}
