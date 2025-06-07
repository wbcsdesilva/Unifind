import SwiftUI

struct AreaDetailsView: View {
    
    let area: Area
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 35){
                
                VStack{
                    AreaProfileCard(area: area)
                    
                    HStack(spacing: 10) {
                        BookButton(action: {})
                        NavButton(action: {})
                    }
                    .padding(.horizontal)
                }

                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Active lecture sessions")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    LecturerScheduledCard(
                        title: "iOS Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02"
                    )
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Scheduled for today")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    LecturerScheduledCard(
                        title: "iOS Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02"
                    )
                    
                    LecturerScheduledCard(
                        title: "iOS Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02"
                    )
                }
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Equipment and facilities")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    AreaEquipmentCard(
                        equipmentName: "Apple iMac M3", equipmentIcon: "macpro.gen1.fill", equipmentAmount: 15, equipmentStatus: "All functional"
                    )
                    AreaEquipmentCard(
                        equipmentName: "Square plug power outlets", equipmentIcon: "poweroutlet.type.g.square", equipmentAmount: 20, equipmentStatus: "All functional"
                    )
                }
                
            }
        }
        
    }
}

#Preview {
    NavigationStack{
        AreaDetailsView(area: DummyData.sampleAreas[1])
    }
}
