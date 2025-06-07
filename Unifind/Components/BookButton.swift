//
//  BookButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import SwiftUI

struct BookButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label("Book", systemImage: "calendar.badge.checkmark")
                .font(.headline)
                .foregroundColor(.accentColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.regularMaterial)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    BookButton(action: {})
}
