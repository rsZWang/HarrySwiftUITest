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
                .padding(10)
                .font(.system(size: 16, weight: .bold))
        }
        .foregroundColor(.white)
        .background(Color(.buttonNormalPink))
        .cornerRadius(10)
    }
}
