//
//  FindLecturersView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import SwiftUI

struct FindLecturersView: View {
    
    private let lecturers: [Lecturer] = DummyData.sampleLecturers
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                // current module lecturers
                VStack{
                    Text("Based on your current modules")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12){
                        ForEach(lecturers) { lecturer in
                            LecturerCard(lecturer: lecturer)
                                .padding(.horizontal)
                        }
                    }
                }.padding(.vertical)
                
                // course
                VStack{
                    Text("Based on your course")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12){
                        ForEach(lecturers) { lecturer in
                            LecturerCard(lecturer: lecturer)
                                .padding(.horizontal)
                        }
                    }
                }.padding(.vertical)
          }
            
        }
        .navigationTitle("Find Lecturers")

        
    }
}

#Preview {
    NavigationStack {
        FindLecturersView()
    }
}
