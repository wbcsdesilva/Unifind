
import SwiftUI
import SVGView

struct BookingView: View {
    @StateObject private var vm: BookingViewModel
    private let allPCs: [PC]

    init(allPCs: [PC]) {
        self.allPCs = allPCs
        _vm = StateObject(wrappedValue: BookingViewModel(allPCs: allPCs))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                zoomableMap

                if let selected = vm.selectedPC {
                    
                    Text("Selected: \(selected.name)")
                        .font(.headline)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    let sessions = vm.sessions[selected.svgID] ?? []
                    ForEach(sessions) { session in
                        BookingSessionCard(
                            session: session,
                            bookAction: { vm.book(session: session, on: selected) }
                        )
                    }
                } else {
                    Text("Tap and select a PC to book a session")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
            }
            .navigationTitle("Book")
        }
    }

    private var zoomableMap: some View {
        ZoomableScrollView {
            mapSVGView
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 450)
                .clipped()
                .background(Color(white: 0.95))
                .cornerRadius(12)
                .padding(.horizontal, 16)
        }
    }

    private var mapSVGView: SVGView {
        let url = Bundle.main.url(forResource: "IOSLab01", withExtension: "svg")!
        let svg = SVGView(contentsOf: url)

        for pc in allPCs {
            let id = pc.svgID
            if let rect = svg.getNode(byId: id) as? SVGRect {
                // 1) Fill color based on sessions
                let sessions         = vm.sessions[id] ?? []
                let bookedCount      = sessions.filter { $0.isBooked }.count
                let totalCount       = sessions.count
                let fillHex: String
                if totalCount == 0 {
                    fillHex = "00FF00"      // no data → green
                } else if bookedCount == 0 {
                    fillHex = "00FF00"      // none booked → green
                } else if bookedCount == totalCount {
                    fillHex = "FF0000"      // all booked → red
                } else {
                    fillHex = "FFFF00"      // partial → yellow
                }
                rect.fill = SVGColor(hex: fillHex)

                // 2) Stroke highlight if selected
                if vm.highlightedPCs[id] == true {
                    rect.stroke = SVGStroke(fill: SVGColor(hex: "0000FF"), width: 4)
                } else {
                    rect.stroke = nil
                }

                // 3) Tap gesture
                rect.onTapGesture {
                    withAnimation { vm.pcTapped(svgID: id) }
                }
            }
        }

        return svg
    }
}


struct ZoomableScrollView<Content: View>: View {
    @GestureState private var scaleState: CGFloat = 1
    @State        private var scale      : CGFloat = 1
    @State        private var offset     : CGSize  = .zero

    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .scaleEffect(scale * scaleState)
            .offset(offset)
            .gesture(
                MagnificationGesture()
                    .updating($scaleState) { value, state, _ in
                        state = value
                    }
                    .onEnded { value in
                        // update scale and enforce minimum
                        scale = max(1, scale * value)
                        // if zoom returned to or below 1, reset offset and scale
                        if scale <= 1 {
                            scale = 1
                            offset = .zero
                        }
                    }
            )
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                        // only pan when zoomed in
                        if scale > 1 {
                            offset = value.translation
                        }
                    }
                    .onEnded { _ in
                        // reset if back to original zoom
                        if scale <= 1 {
                            offset = .zero
                        }
                    }
            )
            .clipped()
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BookingView(allPCs: DummyData.labPCs)
        }
    }
}
