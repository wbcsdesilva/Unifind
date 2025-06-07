//
//  LoginView.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-28.
//

import SwiftUI

// TODO: Come and make this prettier sometime later

struct LoginView: View {
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            Text("Login")
                .font(.title)
                .bold()
                
            Text("Please use your LMS credentials to log into your account.")
            
            Spacer()
            
            IconTextField(sfSymbol: "person", placeholder: "Username", text: $authVM.username)
            IconSecureField(sfSymbol: "lock",  placeholder: "Password", text: $authVM.password)
            
            Spacer()
            
            PrimaryButton(
                label: "Log in",
                action: authVM.login,
                disabled: authVM.username.isEmpty || authVM.password.isEmpty
            )
            
        }
        .padding()
        .navigationTitle("Sign In")
    }
    
}

#Preview {
    LoginView(authVM: AuthViewModel())
}
