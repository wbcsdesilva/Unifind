//
//  HeatPill.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import SwiftUI

struct HeatPill: View {
    
    let area: Area
    
    var body: some View {
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
    
}

#Preview {
    HeatPill(area: DummyData.sampleAreas[0])
}

