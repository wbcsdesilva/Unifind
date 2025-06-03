//
//  AreaHeatRow.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct AreaHeatRow: View {
    let area: AreaHeat

    var body: some View {
        HStack {
            // Icon + area name
            Label {
                Text(area.name)
                    .font(.body)
            } icon: {
                Image(systemName: area.symbol)
                    .foregroundColor(.accentColor)
            }

            Spacer()

            // Heat percent inside a colored capsule
            Text(area.heatLabelText)
                .font(.subheadline).bold()
                .foregroundColor(area.heatColor.labelTextColor)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(area.heatColor.background)
                )
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
        AreaHeatRow(area: AreaHeat(symbol: "building.columns", name: "Library Plaza", heat: 25))
        AreaHeatRow(area: AreaHeat(symbol: "tram.fill",       name: "Main Quad",     heat: 55))
        AreaHeatRow(area: AreaHeat(symbol: "leaf",            name: "Garden Area",   heat: 75))
        AreaHeatRow(area: AreaHeat(symbol: "flame.fill",      name: "Cafeteria",     heat: 95))
    }
    .padding()
}
