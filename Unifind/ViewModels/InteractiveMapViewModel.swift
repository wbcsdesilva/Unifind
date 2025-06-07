//
//  InteractiveMapViewModel.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-04.
//


import Foundation
import Combine

final class InteractiveMapViewModel: ObservableObject {
    
    @Published var highlightedRooms: [String: Bool] = [:]
    @Published var selectedArea: Area? = nil
    @Published var selectedNavPathID: String? = nil

    private var areaBySVGID: [String: Area] = [:]

    let allAreas: [Area]

    init(allAreas: [Area]) {
        self.allAreas = allAreas

        self.areaBySVGID = Dictionary(uniqueKeysWithValues:
            allAreas.map { ($0.svgID, $0) }
        )

        for area in allAreas {
            highlightedRooms[area.svgID] = false
        }
    }

    
    func roomTapped(svgID: String) {
        for key in highlightedRooms.keys {
            highlightedRooms[key] = false
        }

        highlightedRooms[svgID] = true

        selectedArea = areaBySVGID[svgID]
    }

    
    func closeOverlay() {
        selectedArea = nil
        
        for key in highlightedRooms.keys {
            highlightedRooms[key] = false
        }
    }
    
    func showNavLine(for svgID: String) {
        
        let suffix = svgID.hasPrefix("room_")
            ? String(svgID.dropFirst(5))
            : svgID
        let navID = "to_\(suffix)"

        selectedNavPathID = navID
    }
}
