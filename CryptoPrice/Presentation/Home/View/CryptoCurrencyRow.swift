//
//  CryptoCurrencyRow.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//
import SwiftUI

struct CryptoCurrencyRow: View {
    let crypto: CryptoCurrency
    let price: String
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(crypto.name)")
                        .font(.headline)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(price)
                        .font(.headline)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)

                    HStack(spacing: 4) {
                        Image(systemName: crypto.priceChangePercent >= 0 ? "arrow.up.right" : "arrow.down.right")
                        Text(crypto.priceChangePercent.percentFormatted)
                    }
                    .font(.subheadline)
                    .foregroundColor(crypto.priceChangePercent >= 0 ? .green : .red)
                }
                .frame(minWidth: 100)

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(.leading, 4)
            }
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .foregroundColor(.primary)
    }
}
