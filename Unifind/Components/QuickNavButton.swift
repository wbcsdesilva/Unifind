//
//  QuickNavButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct QuickNavButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label("Go", systemImage: "location.fill")
                .font(.subheadline)
                .cornerRadius(8)
        }
        .buttonStyle(.borderedProminent)
        
    }
}
