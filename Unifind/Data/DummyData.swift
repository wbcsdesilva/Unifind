//
//  DummyData.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

// storing all the dummy data here

import Foundation

struct DummyData {
    
    // sample lectures
    // ---------------
    static let sampleLectures: [Lecture] = [
        Lecture(
            courseName: "Data Structures",
            startTime: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!,
            hall: "A101"
        ),
        Lecture(
            courseName: "Operating Systems",
            startTime: Calendar.current.date(bySettingHour: 15, minute: 0, second: 0, of: Date())!,
            endTime: Calendar.current.date(bySettingHour: 16, minute: 0, second: 0, of: Date())!,
            hall: "B202"
        )
    ]
    
    // sample area heat data
    // ---------------------
    static let sampleAreaHeatData: [AreaHeat] = [
        AreaHeat(symbol: "building.columns", name: "Library Plaza", heat: 25),
        AreaHeat(symbol: "tram.fill",        name: "Main Quad",     heat: 55),
        AreaHeat(symbol: "leaf",             name: "Garden Area",   heat: 75),
        AreaHeat(symbol: "flame.fill",       name: "Cafeteria",     heat: 95)
    ]
    
    // sample area data
    // ----------------
    
    static let sampleAreas: [Area] = [
        Area(
            svgID: "room_computer_lab_01",
            name: "Computer Lab – 01",
            imageName: "ComputerLab01",    
            isOpen: true,
            heat: 26,
            type: .reservable
        ),
        Area(
            svgID: "room_ios_lab_01",
            name: "iOS Lab – 01",
            imageName: "IosLab01",
            isOpen: true,
            heat: 45,
            type: .reservable
        )
    ]
    
    // room ids by floor
    // -----------------
    
    static let roomIdsByFloor: [[String]] = [
        // Floor 0 (Ground)
        ["room_lecture_hall_01", "room_lecture_hall_02"],

        // Floor 1 (First)
        ["room_study_area_01", "room_office_03", "room_office_04"],

        // Floor 2 (Second)
        ["room_lecture_hall_09", "room_program_office", "room_library", "room_study_area_02"]
    ]
    
}
