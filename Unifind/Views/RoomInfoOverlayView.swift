import SwiftUI

struct RoomInfoOverlayView: View {

    @EnvironmentObject var vm: InteractiveMapViewModel

    let area: Area
    let onClose: () -> Void

    var body: some View {
        ZStack {
            
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }

            VStack {
                Spacer()

                
                VStack(spacing: 0) {

                    HStack(spacing: 3) {
                        
                        Text(area.name)
                            .font(.title2.weight(.bold))
                            .foregroundColor(.primary)

                        Spacer()

                        Button(action: {
                            
                        }) {
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .frame(width: 32, height: 32)
                                .contentShape(Circle())
                        }


                        Button(action: {
                            onClose()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .frame(width: 32, height: 32)
                                .contentShape(Circle())
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)


                    Spacer(minLength: 24)

                    
                    HStack(spacing: 16) {
                        Spacer()

                        QuickBookButton()

                        QuickNavButton(action: {
                            vm.showNavLine(for: area.svgID)
                            onClose()
                        })
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 8)
                .frame(maxWidth: .infinity)
                .frame(height: 160) 
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}
