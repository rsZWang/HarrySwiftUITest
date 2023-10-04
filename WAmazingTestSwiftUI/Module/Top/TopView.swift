//
//  TopView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack {
            WAButton(title: "top_view_button_airport".localised) {
                
            }
            .padding(10)
            WAButton(title: "top_view_button_product".localised) {
                
            }
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
