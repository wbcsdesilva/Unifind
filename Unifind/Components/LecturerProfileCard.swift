import SwiftUI
import UIKit

struct LecturerProfileCard: View {

    let imageName: String
    
    let name: String

    let statusText: String
    
    let statusColor: Color
 
    let teaches: [String]
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
           
            ZStack(alignment: .topTrailing) {
          
                Image(imageName)
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
                    Text(name)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    StatusPill(statusLabel: "In Lecture", statusColor: Color.yellow)
                }
                
           
                VStack(alignment: .leading) {
                    HStack(spacing: 6) {
                        Image(systemName: "calendar")
                            .font(.headline)
                        Text("Teaches:")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
            
                    ForEach(teaches, id: \.self) { subject in
                        HStack(alignment: .top, spacing: 6) {
                            Text("•")
                                .font(.body)
                            Text(subject)
                                .font(.body)
                        }
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

#Preview  {
    LecturerProfileCard(
            imageName: "LectureHall01",
            name: "Mr. Niranga Dharmarathna",
            statusText: "In Lecture",
            statusColor: .yellow,
            teaches: [
                "Web API Development",
                "Software Security"
        ]
    )
}
