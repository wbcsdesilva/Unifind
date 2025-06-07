
import SwiftUI

struct LecturerScheduledCard: View {

    let title: String
    let subtitle: String
    let timeRange: String
    let location: String
    
    
    // MARK: – Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                // 1) Lecture Title (bold)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                // 2) Subtitle
                Text(subtitle)
                    .font(.subheadline)
                // Keep default color (black) so it matches your screenshot
                    .lineLimit(1)
            }
                
            
            HStack(alignment: .bottom) {
                                
                HStack(spacing: 6) {
                    Image(systemName: "clock")
                    Text(timeRange)
                }
                .font(.subheadline)
                
                Spacer()
                
                HStack(spacing: 6) {
                    Image(systemName: "building.2")
                    Text(location)
                }
                .font(.subheadline)
                
            }
            
                        
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}


/// ─── Preview ─────────────────────────────────────────────────────────────
/// Uses the new `#Preview` macro.  We only add the “Currently scheduled for”
/// text here in the preview, not inside `ScheduledCard` itself.
#Preview {
    VStack(alignment: .leading, spacing: 12) {
        Text("Schedule for today")
            .font(.title2)
            .fontWeight(.bold)
        
        LecturerScheduledCard(
            title: "Web API Lecture - Session 2",
            subtitle: "For batch BSC 24.1P",
            timeRange: "12.00 AM – 3.00 PM",
            location: "Lecture Hall 02"
        )
    }
}
