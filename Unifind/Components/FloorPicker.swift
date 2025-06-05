//
//  FloorPicker.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-04.
//

import SwiftUI

/// A segmented‐control style picker for choosing among floors.
/// Bind `selectedIndex` to a parent @State, and supply a `[String]` of names.
struct FloorPicker: View {
    @Binding var selectedIndex: Int
    let floorNames: [String]

    var body: some View {
        HStack {
            Picker(selection: $selectedIndex, label: Text("")) {
                ForEach(floorNames.indices, id: \.self) { idx in
                    Text(floorNames[idx]).tag(idx)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    // Show the FloorPicker in a VStack so it’s centered and size‐fitting.
    VStack {
        FloorPicker(
            selectedIndex: .constant(1),
            floorNames: ["Ground", "Floor 1", "Floor 2", "Floor 3"]
        )
        .padding(.top, 20)
        Spacer()
    }
    .background(Color(.systemBackground))
}
