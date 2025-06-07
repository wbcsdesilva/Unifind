//
//  UnifindApp.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-27.
//

import SwiftUI

@main
struct UnifindApp: App {
    
    @StateObject private var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authVM.isLoggedIn {
                    NavigationStack{
                        CoreTabView().environmentObject(authVM)
                    }
                } else {
                    LoginView(authVM: authVM)
                }
            }
            .tint(Color(.themePrimary))
        }
    }
}
