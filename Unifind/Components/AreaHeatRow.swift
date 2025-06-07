//
//  AreaHeatRow.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct AreaHeatRow: View {
    let area: Area

    var body: some View {
        HStack {
            Label {
                Text(area.name)
                    .font(.body)
            } icon: {
                Image(systemName: area.symbol)
                    .foregroundColor(.accentColor)
            }

            Spacer()

            HeatPill(area: area)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.regularMaterial)
        )
    }
}

#Preview {
    VStack(spacing: 12) {
        AreaHeatRow(area: allAreas[0])
        AreaHeatRow(area: allAreas[1])
        AreaHeatRow(area: allAreas[2])
        AreaHeatRow(area: allAreas[3])
    }
    .padding()
}
