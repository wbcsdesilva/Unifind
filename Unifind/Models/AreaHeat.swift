//
//  AreaHeat.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI
import Foundation

struct AreaHeat: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let heat: Int

    var heatLabelText: String {
        "\(heat)%"
    }
    
    var heatColor: AreaHeatColor {
        switch heat {
        case   0...30: return .low
        case  31...60: return .moderate
        case  61...85: return .high
        default:        return .veryHigh
        }
    }
}


