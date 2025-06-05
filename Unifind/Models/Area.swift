//
//  Area.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI
import Foundation

enum AreaType {
    case reservable
    case nonReservable
}

struct Area: Identifiable {
    let id = UUID()
    let svgID: String
    let name: String
    let imageName: String
    let isOpen: Bool
    let heat: Int
    let type: AreaType

    var statusText: String {
        isOpen ? "Open now" : "Closed"
    }

    var heatLabelText: String {
        "\(heat)%"
    }

    var heatColor: AreaHeatColor {
        switch heat {
        case 0...30:   return .low
        case 31...60:  return .moderate
        case 61...85:  return .high
        default:       return .veryHigh
        }
    }
}

