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
            floorIndex: 2,
            imageName: "ComputerLab01",
            symbol: "star.fill",
            isOpen: true,
            opensAt: "10.00AM",
            closesAt: "4.00PM",
            heat: 26,
            type: .reservable
        ),
        Area(
            svgID: "room_ios_lab_01",
            name: "iOS Lab – 01",
            floorIndex: 2,
            imageName: "IosLab01",
            symbol: "star.fill",
            isOpen: true,
            opensAt: "9.00 AM",
            closesAt: "4.00 PM",
            heat: 45,
            type: .reservable
        )
    ]
    
    static let sampleLecturers: [Lecturer] = [
        
        Lecturer(
            lecturerId: 1,
            name: "Mr. Thilina",
            teachingSubject: "Data and Information Retrieval",
            statusText: "Out of premesis",
            imageName: "ComputerLab01"
        ),
        Lecturer(
            lecturerId: 2,
            name: "Mr. Fuzail",
            teachingSubject: "Data and Information Retrieval",
            statusText: "Out of premesis",
            imageName: "ComputerLab01"
        ),
        Lecturer(
            lecturerId: 3,
            name: "Mr. Niranga",
            teachingSubject: "Data and Information Retrieval",
            statusText: "Out of premesis",
            imageName: "ComputerLab01"
        )
    
    ]
    
    // room ids by floor
    // -----------------
    
    static let roomIdsByFloor: [[String]] = [
        // Floor 0 (Ground)
        [
            "room_lecture_hall_01",
            "room_lecture_hall_02",
            "room_lecture_hall_03",
            "room_guys_washroom_fg_01",
            "room_guys_washroom_fg_02",
            "room_ladies_washroom_fg_01",
            "room_ladies_washroom_fg_02",
            "room_elevator_fg_01",
            "room_elevator_fg_02",
            "room_stairs_fg_01",
            "room_stairs_fg_02",
            "room_office_01",
            "room_office_02",
            "room_cafeteria",
            "room_dining_area",
            "room_trash_bin_fg",
            "room_water_fountain_fg"
            
        ],

        // Floor 1 (First)
        ["room_study_area_01", "room_office_03", "room_office_04"],

        // Floor 2 (Second)
        ["room_lecture_hall_09", "room_program_office", "room_library", "room_study_area_02"]
    ]
    
    static let labPCs: [PC] = [
            PC(svgID: "unit_pc_01", name: "PC-01"),
            PC(svgID: "unit_pc_02", name: "PC-02"),
            PC(svgID: "unit_pc_03", name: "PC-03"),
            PC(svgID: "unit_pc_04", name: "PC-04"),
            PC(svgID: "unit_pc_05", name: "PC-05"),
            PC(svgID: "unit_pc_06", name: "PC-06"),
            PC(svgID: "unit_pc_07", name: "PC-07"),
            PC(svgID: "unit_pc_08", name: "PC-08"),
            PC(svgID: "unit_pc_09", name: "PC-09"),
            PC(svgID: "unit_pc_10", name: "PC-10"),
            PC(svgID: "unit_pc_11", name: "PC-11"),
            PC(svgID: "unit_pc_12", name: "PC-12"),
            PC(svgID: "unit_pc_13", name: "PC-13"),
            PC(svgID: "unit_pc_14", name: "PC-14"),
            PC(svgID: "unit_pc_15", name: "PC-15"),
    ]
    
}
