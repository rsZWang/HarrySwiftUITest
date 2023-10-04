//
//  WANavBackButton.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct WANavBackButton: View {
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        Button(action: {
            mode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
}


