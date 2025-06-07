import SwiftUI

struct LecturerScheduledNowCard: View {
    
    let title: String
    let subtitle: String
    let timeRange: String
    let location: String
    let goAction: () -> Void
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.subheadline)
                    .lineLimit(1)
            }
                
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    // 3) Clock icon + time range
                    HStack(spacing: 6) {
                        Image(systemName: "clock")
                        Text(timeRange)
                    }
                    .font(.subheadline)
                    
                    // 4) Building icon + location
                    HStack(spacing: 6) {
                        Image(systemName: "building.2")
                        Text(location)
                    }
                    .font(.subheadline)
                }
                
                Spacer()
                
                QuickNavButton(action: {})
                
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}


#Preview {
    VStack(alignment: .leading, spacing: 12) {
        Text("Currently scheduled for")
            .font(.title2)
            .fontWeight(.bold)
        
        LecturerScheduledNowCard(
            title: "Web API Lecture - Session 2",
            subtitle: "For batch BSC 24.1P",
            timeRange: "12.00 AM – 3.00 PM",
            location: "Lecture Hall 02",
            goAction: {
            }
        )
    }
}
