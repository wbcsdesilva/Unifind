//
//  QuickNavButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct QuickNavButton: View {
    var body: some View {
        Button(action: {}) {
            Label("Go", systemImage: "location.fill")
                .font(.subheadline)
                .cornerRadius(8)
        }
        .buttonStyle(.borderedProminent)
        
    }
}
