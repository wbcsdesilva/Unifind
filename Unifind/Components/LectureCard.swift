//
//  LectureCard.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct LectureCard: View {
    let lecture: Lecture
    let coverImage: String

    // DateFormatter for displaying times
    private static let timeFormatter: DateFormatter = {
        let f = DateFormatter()
        f.timeStyle = .short
        return f
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Image(coverImage)
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .clipped()

            
            VStack(alignment: .leading, spacing: 8) {
                Text(lecture.courseName)
                    .font(.headline)
                    .fontWeight(.bold)

                // Lecture hall info with icon
                HStack(spacing: 4) {
                    Image(systemName: "building.columns")
                        .foregroundColor(.accentColor)
                    Text("Hall \(lecture.hall)")
                        .font(.subheadline)
                }

                // Lecture time info with clock icon
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .foregroundColor(.accentColor)
                    Text("\(Self.timeFormatter.string(from: lecture.startTime)) - \(Self.timeFormatter.string(from: lecture.endTime))")
                        .font(.subheadline)
                }

                // 3) Status pill and Go button on same row
                HStack {
                    
                    StatusPill(
                        statusLabel: lecture.statusText,
                        statusColor: lecture.isOngoing ? .red : .green
                    )

                    Spacer()
                    
                    QuickNavButton()
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .background(.regularMaterial)
        .cornerRadius(12)
    }
}

#Preview {
    LectureCard(
        lecture: Lecture(
            courseName: "Data Structures and Algorithms",
            startTime: Calendar.current.date(bySettingHour: 14, minute: 30, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 16, minute: 30, second: 0, of: Date())!,
            hall: "02"
        ),
        coverImage: "LectureHall01" )
    .padding()
}
