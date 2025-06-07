//
//  PrimaryButton.swift
//  Unifind
//
//  Created by Chaniru Sandive on 2025-05-29.
//

import SwiftUI

struct PrimaryButton: View {
    
    let label: String
    let action: () -> Void
    var disabled: Bool = false
    
    var body: some View {
        Button(action: action){
            Text(label)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
        }
        .buttonStyle(.borderedProminent)
        .disabled(disabled)
    }
}
