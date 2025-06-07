//
//  FindView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-06-03.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        
        VStack(spacing: 15){
            
            // ─── Lecturers Card Navigates to LecturerListView ─────
            NavigationLink {
                FindLecturersView()
            } label: {
                FindCategoryButton(
                    iconName: "person.3.fill",
                    title: "Lecturers",
                    descriptionText: "Find any lecturer that is teaching in the university",
                    action: {} // keep empty; NavigationLink handles the tap
                )
            }
            .buttonStyle(.plain)

            // ─── Places Card (example) ────────────────────────────
            NavigationLink {
                // Replace with whatever your “Places” screen is:
                FindPlacesView()
            } label: {
                FindCategoryButton(
                    iconName: "building.columns.fill",
                    title: "Places",
                    descriptionText: "Find places ranging from lecture halls, utility points like water fountains and vending machines",
                    action: {}
                )
            }
            .buttonStyle(.plain)

            // ─── Favorites Card (example) ─────────────────────────
            NavigationLink {
                FindFavoritesView()
            } label: {
                FindCategoryButton(
                    iconName: "star.fill",
                    title: "Favorites",
                    descriptionText: "Find everything that you have marked as favorites",
                    action: {}
                )
            }
            .buttonStyle(.plain)
            
            Spacer()
        }
        .padding(.top)
        .navigationTitle("Find")
        
    }
}


#Preview {
    NavigationStack{
        FindView()
    }
}
