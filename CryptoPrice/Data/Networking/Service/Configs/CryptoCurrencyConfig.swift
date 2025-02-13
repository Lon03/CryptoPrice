//
//  CryptoCurrencyConfig.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum CryptoCurrencyConfig: NetworkConfig {
    var baseUrl: String {
        APIConstants.baseURL
    }

    case tickers

    var path: String {
        "/sapi/v1/"
    }

    var endPoint: String {
        switch self {
        case .tickers:
            "tickers/24hr"
        }
    }

    var task: HTTPTask {
        switch self {
        case .tickers:
            .request
        }
    }

    var method: HTTPMethod {
        .get
    }
}
