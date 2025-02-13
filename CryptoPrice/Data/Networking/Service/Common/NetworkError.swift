//
//  NetworkError.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

enum NetworkError: LocalizedError {
    case missingURL
    case noConnect
    case invalidData
    case requestFailed
    case encodingError
    case decodingError
    case invalidResponse
}
