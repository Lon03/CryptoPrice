//
//  CurrencyManagerTests.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

@testable import CryptoPrice
import XCTest

final class CurrencyManagerTests: XCTestCase {
    private var sut: CurrencyManager!
    private var mockExchangeRateRepository: MockExchangeRateRepository!
    private var mockUserDefaults: UserDefaults!

    override func setUp() {
        super.setUp()
        mockUserDefaults = UserDefaults(suiteName: #file)
        mockUserDefaults.removePersistentDomain(forName: #file)

        mockExchangeRateRepository = MockExchangeRateRepository()
        sut = CurrencyManager(exchangeRateRepository: mockExchangeRateRepository)
        sut.currency = Currency.usd.name
    }

    override func tearDown() {
        sut = nil
        mockExchangeRateRepository = nil
        mockUserDefaults.removePersistentDomain(forName: #file)
        mockUserDefaults = nil
        super.tearDown()
    }

    func test_shouldUpdateRates_whenNoPreviousUpdate_returnsTrue() {
        let result = sut.shouldUpdateRates()

        XCTAssertTrue(result)
    }

    func test_shouldUpdateRates_whenCurrencyNotChanged_returnsFalse() async throws {
        let response = ExchangeRateResponse(rates: ["SEK": 10.5])
        mockExchangeRateRepository.mockResponse = response

        try await sut.updateExchangeRates()

        XCTAssertFalse(sut.shouldUpdateRates())
    }

    func test_format_whenPriceIsLarge_removesDecimalPlaces() async throws {
        let price = 12345.6789

        try await sut.updateExchangeRates()
        let result = sut.format(price, includeSymbol: true)

        XCTAssertEqual(result, "$12,346")
    }

    func test_format_whenPriceIsMedium_showsTwoDecimalPlaces() {
        let price = 1234.5678

        let result = sut.format(price, includeSymbol: true)

        XCTAssertEqual(result, "$1,234.57")
    }

    func test_format_whenPriceIsSmall_showsAppropriateDecimals() {
        let price = 0.12345678

        let result = sut.format(price, includeSymbol: true)

        XCTAssertEqual(result, "$0.12346")
    }

    func test_format_whenCurrencyIsSEK_usesCorrectSymbol() async throws {
        let response = ExchangeRateResponse(rates: ["SEK": 10.5])
        mockExchangeRateRepository.mockResponse = response
        try await sut.updateExchangeRates()
        sut.currency = Currency.sek.name

        let result = sut.format(100, includeSymbol: true)

        XCTAssertEqual(result, "kr1,050")
    }

    func test_updateExchangeRates_whenSuccessful_updatesRates() async throws {
        let response = ExchangeRateResponse(rates: ["SEK": 10.5, "EUR": 0.92])
        mockExchangeRateRepository.mockResponse = response

        try await sut.updateExchangeRates()

        sut.currency = Currency.usd.name
        XCTAssertEqual(sut.format(100, includeSymbol: true), "$100")
        sut.currency = Currency.sek.name
        XCTAssertEqual(sut.format(100, includeSymbol: true), "kr1,050")
    }

    func test_updateExchangeRates_whenError_throwsError() async {
        let error = NetworkError.invalidResponse
        mockExchangeRateRepository.error = error

        do {
            try await sut.updateExchangeRates()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func test_format_whenIncludeSymbolIsFalse_omitsSymbol() {
        let price = 123.45

        let result = sut.format(price, includeSymbol: false)

        XCTAssertEqual(result, "123.45")
    }
}
