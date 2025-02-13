//
//  Routable.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
