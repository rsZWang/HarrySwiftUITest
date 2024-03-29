//
//  AirportListView.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct AirportListView: View {
    
    private let airportList = Bundle.main.decode(Airports.self, from: "airport_list.json")
    
    var body: some View {        
        List(airportList.airports) { airport in
            // Wrap in Button for making navigation click not work
            Button(action: {}) {
                NavigationLink(
                    destination: Text(airport.name)
                ) {
                    Text(airport.name)
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: WANavBackButton())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("airport_list_view_navi_title".localised)
                    .font(.system(size: 18, weight: .medium))
            }
        }
    }
}

struct AirportListView_Previews: PreviewProvider {
    static var previews: some View {
        AirportListView()
    }
}
