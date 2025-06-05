//
//  AreaData.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-05.
//

// all area data
// TODO: might wanna change the image names

let allAreas: [Area] = [
    
    // floor 1:
    // -------
    Area(
      svgID: "room_lecture_hall_01",
      name: "Lecture Hall 1",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 42,
      type: .nonReservable
    ),
    Area(
      svgID: "room_lecture_hall_02",
      name: "Lecture Hall 2",
      imageName: "LectureHall01",
      isOpen: false,
      heat: 15,
      type: .nonReservable
    ),
    
    // floor 2:
    // --------
    Area(
      svgID: "room_study_area_01",
      name: "Study Area A",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .reservable
    ),
    Area(
      svgID: "room_office_03",
      name: "Office 3",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_office_04",
      name: "Office 4",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .nonReservable
    ),

    // floor 3:
    // --------
    Area(
      svgID: "room_lecture_hall_09",
      name: "Lecture Hall 09",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .reservable
    ),
    Area(
      svgID: "room_program_office",
      name: "Program Office",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_library",
      name: "Library",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .nonReservable
    ),
    Area(
      svgID: "room_study_area_02",
      name: "Study Area B",
      imageName: "LectureHall01",
      isOpen: true,
      heat: 78,
      type: .reservable
    ),

]
