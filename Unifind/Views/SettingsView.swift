//
//  SettingsView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        VStack {
            Text("Settings Screen")
                .font(.title2)
            Spacer()
            Button("Log Out", action: authVM.logout)
                .padding()
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
