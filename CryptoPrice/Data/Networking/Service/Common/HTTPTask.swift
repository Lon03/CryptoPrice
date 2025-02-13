//
//  HTTPTask.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

typealias Parameters = [String: Any]

enum HTTPTask {
    case request
    case requestBody(Data)
    case requestUrlParameters(Parameters)
}
