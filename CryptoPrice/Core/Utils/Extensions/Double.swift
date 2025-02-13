//
//  Double.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import Foundation

extension Double {
    /// Formats a number with specified number of decimal places
    /// - Parameter places: Number of decimal places to show
    /// - Returns: Formatted string
    func formatted(places: Int) -> String {
        String(format: "%.\(places)f", self)
    }

    /// Formats percentage value with 2 decimal places
    var percentFormatted: String {
        formatted(places: 2) + "%"
    }

    /// Formats volume value with 2 decimal places
    var volumeFormatted: String {
        formatted(places: 2)
    }
}
