//
//  HomeFactoryProtocol.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

@MainActor
protocol HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> HomeView
}

protocol HomeCoordinatorFactory: HomeViewFactory, CryptoDetailViewFactory {}
