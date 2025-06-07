//
//  Lecturer.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-06.
//

import Foundation

struct Lecturer: Identifiable {
    let id = UUID()
    let lecturerId: Int
    let name: String
    let teachingSubject: String
    let statusText: String
    let imageName: String
}
