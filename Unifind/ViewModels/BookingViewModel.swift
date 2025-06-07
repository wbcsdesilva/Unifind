import Foundation
import Combine

struct Session: Identifiable {
    let id        = UUID()
    let name      : String
    let startTime : String
    let endTime   : String
    let icon      : String
    var isBooked  : Bool
    var bookedBy  : String
}


final class BookingViewModel: ObservableObject {
    
    @Published var highlightedPCs: [String: Bool] = [:]
    @Published var selectedPC: PC? = nil
    @Published var sessions: [String: [Session]] = [:]

    private let pcBySVGID: [String: PC]

    init(allPCs: [PC]) {
        
        pcBySVGID = Dictionary(uniqueKeysWithValues: allPCs.map { ($0.svgID, $0) })

        var highlights  = [String: Bool]()
        var sessionMap  = [String: [Session]]()
        for pc in allPCs {
            highlights[pc.svgID] = false
            sessionMap[pc.svgID] = []
        }

        highlightedPCs = highlights
        sessions       = sessionMap
    }

    func pcTapped(svgID: String) {
        for key in highlightedPCs.keys {
            highlightedPCs[key] = false
        }
        highlightedPCs[svgID] = true
        selectedPC = pcBySVGID[svgID]
    }

    func book(session: Session, on pc: PC) {
        guard var list = sessions[pc.svgID],
              let idx = list.firstIndex(where: { $0.id == session.id })
        else { return }

        list[idx].isBooked  = true
        list[idx].bookedBy  = "You"
        sessions[pc.svgID] = list
    }

    /// (optional) clear selection
    func clearSelection() {
        for key in highlightedPCs.keys {
            highlightedPCs[key] = false
        }
        selectedPC = nil
    }
}
