//
//  HomeView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-28.
//

import SwiftUI

// TODO: Move the sample data somewhere else, otherwise it'll be just difficult to manage

enum Screen: Hashable {
    case profile, settings
}

struct HomeView: View {
    @EnvironmentObject private var authVM: AuthViewModel
    
    @State private var lectures: [Lecture] = DummyData.sampleLectures
    private let areas: [Area] = DummyData.sampleAreas
    
    // ongoing, then upcoming
    private var nextLecture: Lecture? {
           // Check for ongoing
           if let ongoing = lectures.first(where: { $0.isOngoing }) {
               return ongoing
           }
           // Then upcoming
           return lectures
               .filter { $0.startTime > Date() }
               .min(by: { $0.startTime < $1.startTime })
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // welcome section
                // ---------------
                
                WelcomeBanner(studentName: "Chaniru Sandive De Silva")
                
                // lecture card section
                // --------------------
                
                if let lecture = nextLecture {
                    LectureCard(lecture: lecture, coverImage: "LectureHall01")
                        .padding(.horizontal)
                }

                // live heat section
                // ------------------
                
                Text("Live Heat")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                VStack(spacing: 12) {
                    ForEach(areas) { area in
                        AreaHeatRow(area: area)
                            .padding(.horizontal)
                    }
                }
                
                // frequently visited section
                // --------------------------
                
                Text("Frequently visited")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                VStack(spacing: 12){
                    ForEach(areas) { area in
                        AreaCard(area: area)
                            .padding(.horizontal)
                    }
                }
                
                
                
                
            }
            .padding(.vertical)
        }
    }
}


#Preview {
    NavigationStack{
        HomeView().environmentObject(AuthViewModel())
            .tint(.themePrimary)
    }
}

