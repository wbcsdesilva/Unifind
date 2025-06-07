//
//  HeatView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct HeatView: View {
    
    private let areaData: [Area] = allAreas
    
    var body: some View {
        
        ScrollView {
            VStack {
                // list
                VStack(spacing: 12) {
                    ForEach(areaData) { areaHeat in
                        AreaHeatRow(area: areaHeat)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Heat Levels")
        
    }
}

#Preview {
    NavigationStack {
        HeatView()
    }
}
