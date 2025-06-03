//
//  IconTextField.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct IconTextField: View {
    let sfSymbol: String
    let placeholder: String
    @Binding var text: String      

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: sfSymbol)
                .foregroundColor(.themePrimary)
            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(12)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    IconTextField(sfSymbol: "person", placeholder: "Username", text: .constant(""))
        .padding()
}
