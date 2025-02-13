//
//  ExchangeRateConfig.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum ExchangeRateConfig: NetworkConfig {
    var baseUrl: String {
        APIConstants.exchangeRateURL
    }

    case usd

    var path: String {
        "/v4/latest/"
    }

    var endPoint: String {
        switch self {
        case .usd:
            "USD"
        }
    }

    var task: HTTPTask {
        switch self {
        case .usd:
            .request
        }
    }

    var method: HTTPMethod {
        .get
    }
}
