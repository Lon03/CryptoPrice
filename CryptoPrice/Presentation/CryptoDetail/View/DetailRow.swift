//
//  DetailRow.swift
//  CryptoPrice
//
//  Created by Mike on 13.02.2025.
//
import SwiftUI

struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

#Preview("Single Row") {
    DetailRow(
        title: "Price",
        value: "$45,678.90"
    )
    .padding()
}
