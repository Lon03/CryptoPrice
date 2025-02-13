//
//  AppStorage.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//

import SwiftUI

extension AppStorageKey where Value == String {
    static let currency = Self(key: "currency", defaultValue: Currency.usd.name)
}

struct AppStorageKey<Value> {
    let key: String
    let defaultValue: Value
}

extension AppStorage {
    init(_ key: AppStorageKey<Value>, store: UserDefaults? = nil) where Value == String {
        self.init(wrappedValue: key.defaultValue, key.key, store: store)
    }
}

extension AppStorage where Value: ExpressibleByNilLiteral {
    init(_ key: AppStorageKey<Value>, store: UserDefaults? = nil) where Value == String? {
        self.init(key.key, store: store)
    }
}
