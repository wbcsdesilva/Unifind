//
//  MarkedDatesMaker.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import Foundation

extension Date {
    /// Return a copy of this date with hour/minute/second set to midnight in the current calendar.
    func strippedTime(using calendar: Calendar = .current) -> Date {
        let comps = calendar.dateComponents([.year, .month, .day], from: self)
        return calendar.date(from: comps)!
    }
}

func getSampleMarkedDates() -> Set<Date> {
    let calendar = Calendar.current
    let today = Date().strippedTime()              // “Today” at midnight
    let weekday = calendar.component(.weekday, from: today)
    // Compute how many days back to Monday (ISO: Monday = 2, Sunday = 1)
    let daysToMonday = (weekday + 5) % 7
    let mondayThisWeek = calendar.date(byAdding: .day, value: -daysToMonday, to: today)!
    
    // 1) Wednesday of this week = Monday + 2
    let wednesdayThisWeek = calendar.date(byAdding: .day, value: 2, to: mondayThisWeek)!.strippedTime()
    // 2) Friday of this week = Monday + 4
    let fridayThisWeek = calendar.date(byAdding: .day, value: 4, to: mondayThisWeek)!.strippedTime()
    
    // 3) Tuesday of next week = Monday + 7 + 1
    let tuesdayNextWeek = calendar.date(byAdding: .day, value: 8, to: mondayThisWeek)!.strippedTime()
    // 4) Thursday of next week = Monday + 7 + 3
    let thursdayNextWeek = calendar.date(byAdding: .day, value: 10, to: mondayThisWeek)!.strippedTime()
    
    return [ wednesdayThisWeek, fridayThisWeek, tuesdayNextWeek, thursdayNextWeek ]
}


