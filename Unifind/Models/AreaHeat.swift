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

enum AreaHeatColor {
    case low       // green
    case moderate  // yellow
    case high      // orange
    case veryHigh  // red

    var background: Color {
        switch self {
        case .low:      return Color(hue: 0.33, saturation: 0.6, brightness: 0.9).opacity(0.3)
        case .moderate: return Color(hue: 0.15, saturation: 0.8, brightness: 0.9).opacity(0.3)
        case .high:     return Color(hue: 0.08, saturation: 0.9, brightness: 0.9).opacity(0.3)
        case .veryHigh: return Color(hue: 0.0,  saturation: 0.9, brightness: 0.9).opacity(0.3)
        }
    }

    var labelTextColor: Color {
        switch self {
        case .low:      return Color(hue: 0.33, saturation: 0.8, brightness: 0.4)
        case .moderate: return Color(hue: 0.15, saturation: 0.9, brightness: 0.4)
        case .high:     return Color(hue: 0.08, saturation: 0.9, brightness: 0.4)
        case .veryHigh: return Color(hue: 0.0,  saturation: 0.9, brightness: 0.4)
        }
    }
}
