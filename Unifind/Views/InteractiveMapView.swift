//
//  InteractiveMapView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-04.
//

import SwiftUI
import SVGView

struct InteractiveMapView: View {
    // 1) Use a StateObject to own our ViewModel. Inject `allAreas` here.
    @StateObject private var vm: InteractiveMapViewModel

    @State private var searchText: String = ""
    @State private var selectedFloorIndex: Int = 0

    private let floorNames = ["Ground", "First", "Second"]

    // 2) IDs of all tappable rooms, grouped by floor (just SVG IDs)
    private let roomsByFloor: [[String]] = DummyData.roomIdsByFloor

    init() {
        // Suppose AreasData.swift exposes `allAreas` as a global or static var
        let areas = allAreas   // from Data/AreasData.swift
        _vm = StateObject(wrappedValue: InteractiveMapViewModel(allAreas: areas))
    }

    var body: some View {
        ZStack(alignment: .top) {
            // ─── 1) Interactive SVG map ───
            mapSVGLayer
                .ignoresSafeArea(.container, edges: .all)

            // ─── 2) Search & floor picker ───
            VStack(spacing: 8) {
                SearchBar(text: $searchText)
                FloorPicker(selectedIndex: $selectedFloorIndex,
                            floorNames: floorNames)
                Spacer()
            }
            .padding(.top, 8)

            // ─── 3) If an Area is selected, show the overlay and pass the Area
            if let area = vm.selectedArea {
                RoomInfoOverlayView(
                    area: area,
                    onClose: { vm.closeOverlay() }
                )
            }
        }
    }

    /// The SVG layer for the selected floor, hooking up taps to vm.roomTapped(svgID:)
    private var mapSVGLayer: some View {
        // 1) Pick the SVG file name
        let svgName: String
        switch selectedFloorIndex {
        case 0:  svgName = "GroundFloor"
        case 1:  svgName = "FirstFloor"
        case 2:  svgName = "SecondFloor"
        default: svgName = "GroundFloor"
        }

        // 2) Load the SVG from bundle
        let svg = SVGView(contentsOf: Bundle.main.url(
            forResource: svgName,
            withExtension: "svg"
        )!)

        // 3) For each room ID on this floor, set fill + onTap
        let roomIDsForThisFloor = roomsByFloor[selectedFloorIndex]
        for svgID in roomIDsForThisFloor {
            if let roomRect = svg.getNode(byId: svgID) as? SVGRect {
                let isOn = vm.highlightedRooms[svgID] ?? false
                roomRect.fill = isOn
                    ? SVGColor(hex: "00FF00")
                    : SVGColor(hex: "D9D9D9")

                roomRect.onTapGesture {
                    withAnimation {
                        vm.roomTapped(svgID: svgID)
                    }
                }
            }
        }

        // 4) Return the SVG scaled to fill
        return svg
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    InteractiveMapView()
}
