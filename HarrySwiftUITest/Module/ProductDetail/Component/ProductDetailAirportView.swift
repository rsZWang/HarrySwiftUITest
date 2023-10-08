//
//  ProductDetailAirportView.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/5.
//

import SwiftUI

struct ProductDetailAirportView: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .foregroundColor(.waPink)
                
            Text("JR 成田機場站")
                .fontWeight(.medium)
                .padding([.top, .bottom], 8)
            
            Image(systemName: "chevron.down")
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .background { Color.airportSelectionGrey }
    }
}

struct ProductDetailAirportView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailAirportView()
    }
}
