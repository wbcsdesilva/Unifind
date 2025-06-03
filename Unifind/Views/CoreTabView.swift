//
//  CoreTabView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct CoreTabView: View {
    @EnvironmentObject private var authVM: AuthViewModel

    var body: some View {
        TabView {
            // 1) Home
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            // 2) Find
            FindView()
                .tabItem {
                    Label("Find", systemImage: "magnifyingglass")
                }

            // 3) Map
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }

            // 4) Heat
            HeatView()
                .tabItem {
                    Label("Heat", systemImage: "flame.fill")
                }

            // 5) Settings
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    CoreTabView()
        .environmentObject(AuthViewModel())
        .tint(.themePrimary)
}
