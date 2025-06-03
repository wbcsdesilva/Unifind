//
//  Lecture.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import Foundation

struct Lecture: Identifiable {
    let id = UUID()
    let courseName: String
    let startTime: Date
    let endTime: Date
    let hall: String

    var isOngoing: Bool {
        let now = Date()
        return now >= startTime && now <= endTime
    }

    var statusText: String {
        isOngoing ? "Ongoing" : "Incoming"
    }
}
