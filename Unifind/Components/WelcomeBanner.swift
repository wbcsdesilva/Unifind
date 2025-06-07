//
//  WelcomeBanner.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct WelcomeBanner: View {
    let studentName: String

    private var firstWord: String {
        studentName.split(separator: " ", maxSplits: 1, omittingEmptySubsequences: true)
            .first
            .map(String.init) ?? studentName
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome")
                .font(.headline)
                .foregroundColor(.secondary)

            Text(firstWord)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 16) {
        WelcomeBanner(studentName: "Chaniru Sandive")
        WelcomeBanner(studentName: "Chaniru Sandive De Silva")
    }
    .padding()
}
