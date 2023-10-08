//
//  TopView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct TopView: View {
    
//    @State private var isPresentingAirportListView = false
//    @State private var isPresentingProductDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AirportListView()) {
//                    WAButton(
//                        text: Text("top_view_button_airport".localised)
//                            .font(.system(size: 16, weight: .bold))
//                    ) {
//                        isPresentingAirportListView = true
//                    }
                    
                    Text("top_view_button_airport".localised)
                        .font(.system(size: 16, weight: .bold))
                }
                .buttonStyle(NavButtonStyle()) 
                .padding(10)
                
                NavigationLink(destination: ProductDetailView()) {
//                    WAButton(text: Text("top_view_button_product".localised)
//                        .font(.system(size: 16, weight: .bold))
//                    ) {
//                        isPresentingProductDetailView = true
//
//                    }
                    
                    Text("top_view_button_product".localised)
                        .font(.system(size: 16, weight: .bold))
                }
                .buttonStyle(NavButtonStyle())
                .padding(10)
            }
            .navigationTitle("top_view_nav_title".localised)
        }
    }
}

fileprivate struct NavButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color(.buttonPressedPink) : Color(.buttonNormalPink))
            .cornerRadius(10)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
