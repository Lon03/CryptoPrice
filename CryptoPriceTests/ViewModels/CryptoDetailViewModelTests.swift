//
//  CryptoDetailViewModelTests.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import XCTest

@MainActor
final class CryptoDetailViewModelTests: XCTestCase {
    private var sut: CryptoDetailViewModel!
    private var mockCoordinator: MockCryptoDetailCoordinator!
    private var mockCurrencyManager: MockCurrencyManager!
    private var testCrypto: CryptoCurrency!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCoordinator = MockCryptoDetailCoordinator()
        mockCurrencyManager = MockCurrencyManager()
        testCrypto = CryptoCurrency(
            symbol: "BTCUSDT",
            name: "BTC",
            quoteAsset: "USDT",
            lastPrice: 50000,
            volume: 1000,
            openPrice: 49000,
            highPrice: 51000,
            lowPrice: 48000
        )
        sut = CryptoDetailViewModel(
            coordinator: mockCoordinator,
            crypto: testCrypto,
            currencyManager: mockCurrencyManager
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        mockCoordinator = nil
        mockCurrencyManager = nil
        testCrypto = nil
        try super.tearDownWithError()
    }

    func test_init_setsInitialState() {
        XCTAssertEqual(sut.state.crypto, testCrypto)
    }

    func test_formatPrice_delegatesToCurrencyManager() {
        let price = 123.45
        mockCurrencyManager.mockFormattedString = "$123.45"

        let result = sut.formatPrice(price)

        XCTAssertEqual(result, "$123.45")
        XCTAssertEqual(mockCurrencyManager.formatCallCount, 1)
        XCTAssertEqual(mockCurrencyManager.lastFormattedPrice, price)
    }
}
