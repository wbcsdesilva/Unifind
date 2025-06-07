
import SwiftUI

struct LecturerDetailsView: View {
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
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
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Currently scheduled for")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    LecturerScheduledNowCard(
                        title: "Web API Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02",
                        goAction: {
                        }
                    )
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Schedule for today")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    LecturerScheduledCard(
                        title: "Web API Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02"
                    )
                    
                    LecturerScheduledCard(
                        title: "Web API Lecture - Session 2",
                        subtitle: "For batch BSC 24.1P",
                        timeRange: "12.00 AM – 3.00 PM",
                        location: "Lecture Hall 02"
                    )
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Availability")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    AvailabilityCalendar(markedDates: getSampleMarkedDates())
                }

                
                
            }
        }
    }
}

#Preview {
    LecturerDetailsView()
}
