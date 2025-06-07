//
//  NavButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import SwiftUI

struct NavButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label("Go", systemImage: "location.fill")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.accentColor)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        HStack {
            NavButton(action: {})
        }
    }
}
