//
//  LecturerCard.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

//
//  AreaCard.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct LecturerCard: View {
    let lecturer: Lecturer
    private let cardHeight: CGFloat = 140

    var body: some View {
        HStack(spacing: 0) {
            
            // left
            Image(lecturer.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: cardHeight)
                .clipped()

            // right
            VStack(alignment: .leading, spacing: 8) {
                
                // push down spacer
                Spacer(minLength: 0)

                // lecturer name
                Text(lecturer.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                // teaching subject
                Label {
                    Text(lecturer.teachingSubject)
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
                    StatusPill(statusLabel: lecturer.statusText, statusColor:
                                Color.orange)
                    
                    Spacer()
                    
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
        LecturerCard(lecturer: DummyData.sampleLecturers[0])
        LecturerCard(lecturer: DummyData.sampleLecturers[1])
    }
    .padding()
}
