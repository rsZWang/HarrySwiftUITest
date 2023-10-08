//
//  ProductDetailTitleView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/6.
//

import SwiftUI

struct ProductDetailTitleView: View {
    
    @ObservedObject var viewModel: ProductDetailViewModel
    
    private var item: ProductDetailTitleViewItem {
        viewModel.titleItem
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Title section
            HStack(spacing: 10) {
                makeTitle(brand: item.brand, name: item.name)
                Spacer()
                makeButton()
            }
            
            // Price Section
            HStack {
                makePrice(
                    original: item.originalPrice,
                    current: item.currentPrice,
                    jpy: item.jpy
                )
                Spacer()
            }
            .padding(.top, 16)
            
            // Make Desc
            HStack {
                makeDesc()
                Spacer()
            }
            .padding(.top, 16)
            
            // Airport selection
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("product_detail_button_pick_up_location".localised)
                        .font(.system(size: 18))
                }
                .foregroundColor(.buttonNormalPink)
            }
            .padding(.top, 16)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func makeTitle(brand: String, name: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 2) {
                Image(systemName: "tag")
                    .foregroundColor(.waPink)
                
                Text(brand)
                    .font(.system(size: 14))
                    .foregroundColor(.waPink)
            }
            
            Text(name)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    private func makeButton() -> some View {
        HStack(spacing: 6) {
            makeButton(image: "square.and.arrow.up") {
                
            }
            .foregroundColor(.black)
            
            makeButton(image: viewModel.isLiked ? "heart.fill" : "heart") {
                viewModel.toggleLike()
            }
            .foregroundColor(viewModel.isLiked ? .buttonNormalPink : .black)
        }
    }
    
    private func makeButton(image: String, action: @escaping () -> ()) -> some View {
        Button(action: action) {
            Image(systemName: image)
                .padding(10)
                .background(Color.airportSelectionGrey)
                .clipShape(Circle())
        }
        
    }
    
    private func makePrice(original: String, current: String, jpy: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(original)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .strikethrough()
            
            HStack(alignment: .bottom, spacing: 6) {
                Text(current)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.waPink)
                
                Text(jpy)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
                    .padding(.bottom, 2)
            }
            .padding(.top, 6)
            
            HStack(spacing: 4) {
                Text("product_detail_title_tax_free_price".localised)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .scaledToFit()
            }
            .padding(.top, 6)
        }
    }
    
    private func makeDesc() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .scaledToFit()
                
                let string = String(
                    format: "product_detail_desc_amount_limit".localised,
                    item.amountLimit
                )
                Text(string)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .scaledToFit()
                
                let string = String(
                    format: "product_detail_desc_date_time_location".localised,
                    item.time,
                    item.pickUpDateTime,
                    item.pickUpLocation
                )
                Text(string)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            .padding(.top, 6)
        }
    }
}

struct ProductDetailTitleViewItem {
    let brand: String
    let name: String
    let originalPrice: String
    let currentPrice: String
    let jpy: String
    let amountLimit: Int
    let time: String
    let pickUpDateTime: String
    let pickUpLocation: String
    
    static let empty = ProductDetailTitleViewItem(
        brand: "",
        name: "",
        originalPrice: "",
        currentPrice: "",
        jpy: "",
        amountLimit: 0,
        time: "",
        pickUpDateTime: "",
        pickUpLocation: ""
    )
}

struct ProductDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailTitleView(viewModel: ProductDetailViewModel())
    }
}
