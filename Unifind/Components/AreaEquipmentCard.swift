import SwiftUI

struct AreaEquipmentCard: View {
    
    let equipmentName: String
    let equipmentIcon: String
    let equipmentAmount: Int
    let equipmentStatus: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Label {
                    Text(equipmentName)
                        .font(.headline)
                } icon: {
                    Image(systemName: equipmentIcon)
                        .font(.subheadline)
                        .foregroundColor(.accentColor)
                }
                
                
                Spacer()
                
                Text("x\(equipmentAmount)")
                
            }
            
            StatusPill(statusLabel: equipmentStatus, statusColor: Color.green)
            
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .cornerRadius(16)
        .padding(.horizontal)
        
    }
}

#Preview {
    AreaEquipmentCard(
        equipmentName: "Apple iMac M3", equipmentIcon: "macpro.gen1.fill", equipmentAmount: 15, equipmentStatus: "All functional"
    )
}
