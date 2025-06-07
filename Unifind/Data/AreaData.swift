//
//  AreaData.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-05.
//

// all area data
// TODO: need to change image names

let allAreas: [Area] = [
    
    // floor 1:
    // -------
    Area(
      svgID: "room_lecture_hall_01",
      name: "Lecture Hall 1",
      floorIndex: 0,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 42,
      type: .nonReservable
    ),
    Area(
      svgID: "room_lecture_hall_02",
      name: "Lecture Hall 2",
      floorIndex: 0,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: false,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 15,
      type: .nonReservable
    ),
    Area(
      svgID: "room_guys_washroom_fg_02",
      name: "Gents Washroom B",
      floorIndex: 0,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: false,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 15,
      type: .nonReservable
    ),

    
    // floor 2:
    // --------
    Area(
      svgID: "room_study_area_01",
      name: "Study Area A",
      floorIndex: 1,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .reservable
    ),
    Area(
      svgID: "room_office_03",
      name: "Office 3",
      floorIndex: 1,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_office_04",
      name: "Office 4",
      floorIndex: 1,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .nonReservable
    ),

    // floor 3:
    // --------
    Area(
      svgID: "room_lecture_hall_09",
      name: "Lecture Hall 9",
      floorIndex: 2,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .reservable
    ),
    Area(
      svgID: "room_program_office",
      name: "Program Office",
      floorIndex: 2,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_library",
      name: "Library",
      floorIndex: 2,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_study_area_02",
      name: "Study Area B",
      floorIndex: 2,
      imageName: "LectureHall01",
      symbol: "star.fill",
      isOpen: true,
      opensAt: "9.00 AM",
      closesAt: "4.00 PM",
      heat: 78,
      type: .reservable
    ),

]
