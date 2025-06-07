//
//  IconSecureField.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct IconSecureField: View {
    let sfSymbol: String            
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: sfSymbol)
                .foregroundColor(.themePrimary)
            SecureField(placeholder, text: $text)
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    IconSecureField(sfSymbol: "lock", placeholder: "Password", text: .constant(""))
        .padding()
}
