// RoomInfoOverlayView.swift

import SwiftUI

struct RoomInfoOverlayView: View {
    let area: Area
    let onClose: () -> Void

    var body: some View {
        ZStack {
            // Semi-transparent backdrop
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }

            // Push the card to the bottom
            VStack {
                Spacer()

                VStack(spacing: 16) {
                    // 1) Show the display name
                    Text(area.name)
                        .font(.title2.weight(.bold))

                    // 2) Show a status text (Open / Closed)
                    Text(area.statusText)
                        .font(.subheadline)
                        .foregroundColor(area.isOpen ? .green : .red)

                    // 3) Show “heat” as a colored label
                    HStack {
                        Circle()
                            .fill(area.heatColor.background)
                            .frame(width: 12, height: 12)
                        Text(area.heatLabelText)
                            .font(.subheadline)
                    }

                    // 4) Show the custom buttons
                    HStack(spacing: 16) {
                        QuickBookButton()
                        QuickNavButton()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(24)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 8)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

#if DEBUG
struct RoomInfoOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy Area for preview
        let dummy = Area(
            svgID: "room_lecture_hall_01",
            name: "Lecture Hall 1",
            imageName: "lecture_hall_icon",
            isOpen: true,
            heat: 42,
            type: .nonReservable
        )
        RoomInfoOverlayView(area: dummy) { }
            .previewDevice("iPhone 14")
    }
}
#endif
