import SwiftUI
import SVGView

struct InteractiveMapView: View {

    @StateObject private var vm: InteractiveMapViewModel
    @State private var searchText: String = ""
    @State private var selectedFloorIndex: Int = 0
    
    // zoom and pan
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    @State private var isGestureActive: Bool = false
    
    private let floorNames = ["Ground", "First", "Second"]
    private let roomsByFloor: [[String]] = DummyData.roomIdsByFloor

    private let minScale: CGFloat = 1.0
    private let maxScale: CGFloat = 4.0

    
    private var filteredAreas: [Area] {
        guard !searchText.isEmpty else { return [] }
        return allAreas.filter { area in
            area.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    init() {
        let areas = allAreas
        _vm = StateObject(wrappedValue: InteractiveMapViewModel(allAreas: areas))
    }

    var body: some View {
        ZStack(alignment: .top) {
            
            mapSVGLayer
                .ignoresSafeArea()   // full screen
                .scaleEffect(scale)
                .offset(offset)
                .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.7), value: scale)
                .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.7), value: offset)
                .gesture(
                    SimultaneousGesture(
                        MagnificationGesture()
                            .onChanged { value in
                                isGestureActive = true
                                let delta = value / lastScale
                                lastScale = value
                                
                                scale = min(maxScale, max(minScale, scale * delta))
                            }
                            .onEnded { _ in
                                isGestureActive = false
                                lastScale = 1.0
                                // snap to min/max if very close
                                if scale < minScale + 0.1 {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        scale = minScale
                                    }
                                } else if scale > maxScale - 0.1 {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        scale = maxScale
                                    }
                                }
                            },
                        DragGesture()
                            .onChanged { value in
                                isGestureActive = true
                                let newOffset = CGSize(
                                    width: lastOffset.width + value.translation.width,
                                    height: lastOffset.height + value.translation.height
                                )
                                
                                let screenWidth = UIScreen.main.bounds.width
                                let screenHeight = UIScreen.main.bounds.height
                                let maxOffsetX = (scale - 1) * screenWidth / 2
                                let maxOffsetY = (scale - 1) * screenHeight / 2
                                
                                
                                let constrainedWidth = min(maxOffsetX, max(-maxOffsetX, newOffset.width))
                                let constrainedHeight = min(maxOffsetY, max(-maxOffsetY, newOffset.height))
                                

                                let resistance: CGFloat = 0.3
                                if abs(constrainedWidth) >= maxOffsetX {
                                    offset.width = lastOffset.width + (value.translation.width * resistance)
                                } else {
                                    offset.width = constrainedWidth
                                }
                                
                                if abs(constrainedHeight) >= maxOffsetY {
                                    offset.height = lastOffset.height + (value.translation.height * resistance)
                                } else {
                                    offset.height = constrainedHeight
                                }
                            }
                            .onEnded { _ in
                                isGestureActive = false
                                lastOffset = offset
                                
                                
                                let screenWidth = UIScreen.main.bounds.width
                                let screenHeight = UIScreen.main.bounds.height
                                let maxOffsetX = (scale - 1) * screenWidth / 2
                                let maxOffsetY = (scale - 1) * screenHeight / 2
                                
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    offset = CGSize(
                                        width: min(maxOffsetX, max(-maxOffsetX, offset.width)),
                                        height: min(maxOffsetY, max(-maxOffsetY, offset.height))
                                    )
                                }
                            }
                    )
                )

            
            FloorPicker(
                selectedIndex: $selectedFloorIndex,
                floorNames: floorNames
            )
            .padding(.horizontal, 16)

            // reset
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: resetMapState) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
            // Navigation status box
            VStack {
                Spacer()
                if let navID = vm.selectedNavPathID,
                   let area = allAreas.first(where: { $0.svgID == navID.replacingOccurrences(of: "to_", with: "room_") }) {
                    HStack {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                        Text("Navigating to:")
                            .foregroundColor(.white)
                        Text(area.name)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 24/255, green: 49/255, blue: 97/255))
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.spring(), value: navID)
                }
            }
            .ignoresSafeArea(.keyboard)
            
            if let area = vm.selectedArea {
                RoomInfoOverlayView(
                    area: area,
                    onClose: { vm.closeOverlay() }
                )
                .environmentObject(vm)
            }
        }
        // searchable
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search for a room or area"
        ) {
            ForEach(filteredAreas) { area in
                Button {
                    didTapSuggestion(area)
                } label: {
                    Text(area.name)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    
    }

    
    private func didTapSuggestion(_ area: Area) {
        
        searchText = area.name

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            searchText = ""
        }

        selectedFloorIndex = area.floorIndex

        
        vm.roomTapped(svgID: area.svgID)
    }

    // svg layer map
    private var mapSVGLayer: some View {
        let svgName: String
        switch selectedFloorIndex {
        case 0: svgName = "GroundFloor"
        case 1: svgName = "FirstFloor"
        case 2: svgName = "SecondFloor"
        default: svgName = "GroundFloor"
        }

        let svg = SVGView(
            contentsOf: Bundle.main.url(
                forResource: svgName,
                withExtension: "svg"
            )!
        )

        let roomIDs = roomsByFloor[selectedFloorIndex]

        for roomID in roomIDs {
            let suffix = roomID.hasPrefix("room_")
                ? String(roomID.dropFirst(5))
                : roomID
            let navID = "to_\(suffix)"
            if let navPath = svg.getNode(byId: navID) as? SVGPath {
                navPath.opacity = 0.0
            }
        }

        
        if let chosenNavID = vm.selectedNavPathID,
           let chosenPath = svg.getNode(byId: chosenNavID) as? SVGPath {
            withAnimation {
                chosenPath.opacity = 1.0
            }
        }

        for svgID in roomIDs {
            if let roomRect = svg.getNode(byId: svgID) as? SVGRect {
                let isTapped = vm.highlightedRooms[svgID] ?? false

                if isTapped {
                    roomRect.stroke = SVGStroke(
                        fill: SVGColor(hex: "0000FF"),
                        width: 5.0
                    )
                } else {
                    roomRect.stroke = nil
                }

                roomRect.onTapGesture {
                    withAnimation {
                        vm.roomTapped(svgID: svgID)
                    }
                }
            }
        }

        return svg
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // reset
    private func resetMapState() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            scale = minScale
            offset = .zero
            lastOffset = .zero
            lastScale = 1.0
            
            vm.selectedNavPathID = nil
            vm.selectedArea = nil
            vm.highlightedRooms = [:]
        }
    }
}


#Preview {
    NavigationStack {
        InteractiveMapView()
    }
}
