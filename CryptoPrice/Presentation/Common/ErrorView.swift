//
//  ErrorView.swift
//  CryptoPrice
//
//  Created by Mike on 12.02.2025.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.red)

            Text(message)
                .multilineTextAlignment(.center)

            Button(L10n.Common.retry) {
                retryAction()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ErrorView(message: "Something went wrong") {}
}
