//
//  InteractiveMapViewModel.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-04.
//


import Foundation
import Combine

final class InteractiveMapViewModel: ObservableObject {
    /// Maps each room ID (svgID) to whether it is highlighted (green)
    @Published var highlightedRooms: [String: Bool] = [:]

    /// The Area that was tapped (nil = no overlay)
    @Published var selectedArea: Area? = nil

    /// A fast lookup from svgID → Area
    private var areaBySVGID: [String: Area] = [:]

    /// All the areas loaded from your data file
    let allAreas: [Area]

    init(allAreas: [Area]) {
        self.allAreas = allAreas

        // Build the dictionary so we can look up by svgID
        self.areaBySVGID = Dictionary(uniqueKeysWithValues:
            allAreas.map { ($0.svgID, $0) }
        )

        // Optionally: initialize highlight map to false for each svgID
        for area in allAreas {
            highlightedRooms[area.svgID] = false
        }
    }

    /// Called whenever the user taps a room <rect> in the SVG.
    func roomTapped(svgID: String) {
        // 1) Toggle highlight state (defaulting to false)
        let currently = highlightedRooms[svgID] ?? false
        highlightedRooms[svgID] = !currently

        // 2) Look up & store the tapped Area (could be nil if ID not found)
        selectedArea = areaBySVGID[svgID]
    }

    /// Called when the overlay’s “Close” is pressed.
    func closeOverlay() {
        selectedArea = nil
    }
}
