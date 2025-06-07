//
//  AreaCard.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct AreaCard: View {
    let area: Area
    private let cardHeight: CGFloat = 140

    var body: some View {
        HStack(spacing: 0) {
            
            // left
            Image(area.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: cardHeight)
                .clipped()

            // right
            VStack(alignment: .leading, spacing: 8) {
                
                // push down spacer
                Spacer(minLength: 0)

                // a) Area Name
                Text(area.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                // b) Open or closed
                Label {
                    Text(area.statusText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } icon: {
                    Image(systemName: "clock")
                        .font(.subheadline)
                        .foregroundColor(.accentColor)
                }

                Spacer()

                // c) Heat pill + (optional) Book + Go buttons
                HStack(spacing: 8) {
                    // Heat pill
                    Text(area.heatLabelText)
                        .font(.subheadline).bold()
                        .foregroundColor(area.heatColor.labelTextColor)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(area.heatColor.background)
                        )
                        .fixedSize()
                    
                    Spacer()
                    
                    // for reservable areas
                    if area.type == .reservable {
                        QuickBookButton()
                    }
                    
                    QuickNavButton(action: {})
                    
                }
                

                Spacer(minLength: 0) // push up
            }
            .frame(height: cardHeight)
            .padding(.horizontal)
            .background(.regularMaterial)
        }
        .frame(height: cardHeight)      
        .cornerRadius(12)
    }
}

#Preview {
    VStack(spacing: 16) {
        AreaCard(area: DummyData.sampleAreas[0])
        AreaCard(area: DummyData.sampleAreas[1])
    }
    .padding()
}
