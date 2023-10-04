//
//  WAButton.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct WAButton: View {
    
    var title: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
        }
        .buttonStyle(WAButtonStyle())
    }
}

struct WAButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color(.buttonPressedPink) : Color(.buttonNormalPink))
            .cornerRadius(10)
    }
}
