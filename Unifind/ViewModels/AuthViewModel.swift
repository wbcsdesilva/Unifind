//
//  AuthViewModel.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-28.
//

import Foundation
import SwiftUI

final class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published private(set) var isLoggedIn: Bool = false
    
    func login() {
        isLoggedIn = true
    }
    
    func logout(){
        username = ""
        password = ""
        isLoggedIn = false
    }
}
