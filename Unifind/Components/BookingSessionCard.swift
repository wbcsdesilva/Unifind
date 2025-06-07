//
//  BookingSessionCard.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-07.
//

import SwiftUI

struct BookingSessionCard: View {
    
    let session: Session
    let bookAction: () -> Void
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading) {
                Label {
                    Text(session.name)
                        .font(.headline)
                } icon: {
                    Image(systemName: session.icon)
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                    
                Label {
                    Text("\(session.startTime) - \(session.endTime)")
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(.secondary)
                        
                }
                
            }
            
            HStack {
                StatusPill(statusLabel: session.isBooked ? "Booked" : "Available", statusColor: session.isBooked ? .orange : .green)
                
                Spacer()
                
                Button(action: bookAction) {
                    QuickBookButton()
                }
                .disabled(session.isBooked)
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
    BookingSessionCard(
        session: Session(
            name: "Morning Session",
            startTime: "9.00 AM",
            endTime: "12.00 PM",
            icon: "sun.min.fill",
            isBooked: true,
            bookedBy: "K.M. Samarawickrama"
        ),
        bookAction: {}
    )
}
