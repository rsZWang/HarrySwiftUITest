//
//  TopView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct TopView: View {
    
    @State private var isPresentingAirportListView = false
    @State private var isPresentingProductDetailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AirportListView(), isActive: $isPresentingAirportListView) {
                    WAButton(title: "top_view_button_airport".localised) {
                        isPresentingAirportListView = true
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(10)
                
                NavigationLink(destination: AirportListView(), isActive: $isPresentingProductDetailView) {
                    WAButton(title: "top_view_button_product".localised) {
                        isPresentingProductDetailView = true
                    }
                }
            }
            .navigationTitle("トップ")
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
