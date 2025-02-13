//
//  SettingsViewModelTests.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import XCTest

@MainActor
final class SettingsViewModelTests: XCTestCase {
    private var sut: SettingsViewModel!
    private var mockCoordinator: MockSettingsCoordinator!
    private var mockUserDefaults: UserDefaults!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUserDefaults = UserDefaults(suiteName: #file)
        mockUserDefaults.removePersistentDomain(forName: #file)

        mockCoordinator = MockSettingsCoordinator()
        sut = SettingsViewModel(coordinator: mockCoordinator, userDefaults: mockUserDefaults)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockCoordinator = nil
        mockUserDefaults.removePersistentDomain(forName: #file)
        mockUserDefaults = nil
        try super.tearDownWithError()
    }

    func test_init_setsDefaultCurrency() {
        XCTAssertEqual(sut.state.selectedCurrency, .usd)
    }

    func test_onUpdateCurrency_updatesCurrencyState() {
        sut.handle(.onUpdateCurrency(.sek))

        XCTAssertEqual(sut.state.selectedCurrency, .sek)
        XCTAssertEqual(sut.currency, Currency.sek.name)
    }

    func test_onUpdateCurrency_persistsSelection() {
        let newCurrency = Currency.sek

        sut.handle(.onUpdateCurrency(newCurrency))

        let newViewModel = SettingsViewModel(coordinator: mockCoordinator)
        XCTAssertEqual(newViewModel.state.selectedCurrency, newCurrency)
    }
}
