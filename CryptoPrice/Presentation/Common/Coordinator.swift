//
//  Coordinator.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

protocol Coordinator: ObservableObject where Screen: Routable {
    associatedtype Screen
    var navigationPath: [Screen] { get }
}
