//
//  AirportListView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import SwiftUI

struct AirportListView: View {
    
    let airportList = Bundle.main.decode(Airports.self, from: "airport_list.json")
    
    var body: some View {
//        VStack {
//            Text("airport_list_view_navi_title".localised)
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//
//                    }
//                }
//        }
        
        List(airportList.airports) { airport in
            NavigationLink(destination: AirportListView()) {
                Text(airport.name)
            }
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
