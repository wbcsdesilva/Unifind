import SwiftUI

struct AreaProfileCard: View  {
    
    let area: Area
        
    @State private var isFavorite: Bool = false

    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack(alignment: .topTrailing) {
                // 1) The background image
                Image(area.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()

                
                Button {
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .font(.title2.weight(.semibold))
                        .foregroundColor(isFavorite ? .yellow : .white)
                        .padding(10)
                        .background(Color.black.opacity(0.4))
                        .clipShape(Circle())
                }
                .padding(8)
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                

                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(area.name)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    HStack {
                        Label {
                            Text("\(area.opensAt) - \(area.closesAt)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        } icon: {
                            Image(systemName: "clock")
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                        
                        Spacer()
                        
                        HeatPill(area: area)
                    }
                    
                }
                
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.regularMaterial)
        }
        .background(.regularMaterial)
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
}

#Preview{
    AreaProfileCard(
        area: DummyData.sampleAreas[0]
    )
}
