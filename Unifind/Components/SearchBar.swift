//
//  SearchBar.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-04.
//

import SwiftUI

/// A styled search bar (magnifying‐glass + TextField).
/// Bind its `text` to a @State in the parent.
struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("What do you want to find?", text: $text)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.regularMaterial)
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
}

#Preview {
    // Display the SearchBar alone in a VStack so it doesn't stretch full‐screen.
    VStack {
        SearchBar(text: .constant("Sample query"))
            .padding(.top, 40)
            .background(Color(.systemBackground))
        Spacer()
    }
}
