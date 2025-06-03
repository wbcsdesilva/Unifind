//
//  QuickBookButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct QuickBookButton: View {
    
    var body: some View {
        Button(action: {}) {
            Label("Book", systemImage: "calendar.badge.checkmark")
                .font(.subheadline)
                .foregroundColor(.accentColor)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.themePrimary.opacity(0.1))
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    QuickBookButton()
}
