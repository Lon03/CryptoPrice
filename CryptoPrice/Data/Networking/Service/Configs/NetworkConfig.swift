//
//  NetworkConfig.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

protocol NetworkConfig {
    var baseUrl: String { get }
    var path: String { get }
    var endPoint: String { get }

    var task: HTTPTask { get }
    var method: HTTPMethod { get }
}
