//
//  FindPlacesView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import SwiftUI

struct FindPlacesView: View {
    
    private let areas: [Area] = DummyData.sampleAreas
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                // based on your current modules section
                VStack{
                    Text("Based on your current modules")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12){
                        ForEach(areas) { area in
                            AreaCard(area: area)
                                .padding(.horizontal)
                        }
                    }
                }.padding(.vertical)
                
                // public areas section
                VStack{
                    Text("Public areas")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12){
                        ForEach(areas) { area in
                            AreaCard(area: area)
                                .padding(.horizontal)
                        }
                    }
                }.padding(.vertical)
          }
            
        }
        .navigationTitle("Find Places")
        
    }
}

#Preview {
    NavigationStack{
        FindPlacesView()
    }
}
