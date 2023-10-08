//
//  WAButton.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct WAButton: View {
    
    var text: Text
    var icon: Image? = nil
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            HStack(spacing: 10) {
                if let icon = icon {
                    icon
                }
            
                Image(systemName: "cart")
                    .font(.system(size: 20, weight: .bold))
                
                text
            }
        }
        .buttonStyle(WAButtonStyle())
    }
}

struct WAButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color(.buttonPressedPink) : Color(.buttonNormalPink))
            .cornerRadius(10)
    }
}
