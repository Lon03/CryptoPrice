//
//  HomeViewModelTests.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import XCTest

@MainActor
final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    private var mockCoordinator: MockHomeCoordinator!
    private var mockCryptoRepository: MockCryptoCurrencyRepository!
    private var mockCurrencyManager: MockCurrencyManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCoordinator = MockHomeCoordinator()
        mockCryptoRepository = MockCryptoCurrencyRepository()
        mockCurrencyManager = MockCurrencyManager()
        sut = HomeViewModel(
            coordinator: mockCoordinator,
            cryptoCurrencyRepository: mockCryptoRepository,
            currencyManager: mockCurrencyManager
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        mockCoordinator = nil
        mockCryptoRepository = nil
        mockCurrencyManager = nil
        try super.tearDownWithError()
    }

    func test_loadData_whenSuccessful_updatesState() async {
        let cryptos = [
            CryptoCurrency(symbol: "BTCUSDT", name: "BTC", quoteAsset: "USDT", lastPrice: 50000, volume: 1000, openPrice: 49000, highPrice: 51000, lowPrice: 48000),
        ]
        mockCryptoRepository.mockCryptos = cryptos

        await sut.loadData()

        XCTAssertEqual(sut.state.currentState, .loaded)
        XCTAssertEqual(sut.state.cryptocurrencies, cryptos)
    }

    func test_onCryptoCurrencyTap_navigatesToDetail() {
        let crypto = CryptoCurrency(symbol: "BTCUSDT", name: "BTC", quoteAsset: "USDT", lastPrice: 50000, volume: 1000, openPrice: 49000, highPrice: 51000, lowPrice: 48000)

        sut.handle(.onCryptoCurrencyTap(crypto: crypto))

        XCTAssertEqual(mockCoordinator.navigatedToCrypto, crypto)
    }

    func test_formatPrice_delegatesToCurrencyManager() {
        let price = 123.45
        mockCurrencyManager.mockFormattedString = "$123.45"

        let result = sut.formatPrice(price)

        XCTAssertEqual(result, "$123.45")
        XCTAssertEqual(mockCurrencyManager.formatCallCount, 1)
        XCTAssertEqual(mockCurrencyManager.lastFormattedPrice, price)
    }

    func test_loadData_whenRefreshing_skipsLoadingState() async {
        let cryptos = [
            CryptoCurrency(symbol: "BTCUSDT", name: "BTC", quoteAsset: "USDT", lastPrice: 50000, volume: 1000, openPrice: 49000, highPrice: 51000, lowPrice: 48000),
        ]
        mockCryptoRepository.mockCryptos = cryptos

        await sut.loadData(isRefreshing: true)

        XCTAssertEqual(sut.state.currentState, .loaded)
        XCTAssertEqual(sut.state.cryptocurrencies, cryptos)
    }

    func test_loadData_whenShouldNotUpdateRates_returnsEarly() async {
        mockCurrencyManager.shouldUpdateRatesReturnValue = false

        await sut.loadData()

        XCTAssertEqual(mockCryptoRepository.fetchCallCount, 0)
    }
}
