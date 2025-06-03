//
//  StatusPill.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-02.
//

import SwiftUI;

struct StatusPill: View {
    
    let statusLabel: String
    let statusColor: Color
    
    var body: some View {
        HStack (spacing: 4) {
            Circle()
                .fill(statusColor)
                .frame(width: 12, height: 12)
            
            Text(statusLabel)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(
            Capsule()
                .fill(Color(.systemGray5))
        )
    }
}

#Preview {
    StatusPill(statusLabel: "Incoming", statusColor: .green)
}
