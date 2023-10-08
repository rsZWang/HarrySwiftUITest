//
//  ProductDetailTitleView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/6.
//

import SwiftUI

struct ProductDetailTitleView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            // Title section
            HStack(spacing: 10) {
                makeTitle(brand: "資生堂", name: "光采無瑕妝前凝霜 40g")
                Spacer()
                makeButton()
            }
            
            // Price Section
            HStack {
                makePrice(
                    original: "NT$ 1644.14",
                    current: "NT$ 1494.67",
                    yen: "JPY 6,500"
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
                    Text("選擇取貨機場")
                        .font(.system(size: 18))
                        .foregroundColor(.buttonNormalPink)
                }
            }
            .padding(.top, 16)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func makeTitle(brand: String, name: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 2) {
                Image(systemName: "tag")
                    .foregroundColor(.buttonNormalPink)
                
                Text(brand)
                    .font(.system(size: 14))
                    .foregroundColor(.buttonNormalPink)
            }
            
            Text(name)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.black)
        }
    }
    
    private func makeButton() -> some View {
        HStack(spacing: 6) {
            makeButton(image: "square.and.arrow.up")
            makeButton(image: "heart")
        }
    }
    
    private func makeButton(image: String) -> some View {
        Button(action: {}) {
            Image(systemName: image)
                .padding(10)
                .background(Color.airportSelectionGrey)
                .clipShape(Circle())
        }
        .foregroundColor(.black)
    }
    
    private func makePrice(original: String, current: String, yen: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(original)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .strikethrough()
            
            HStack(alignment: .bottom, spacing: 6) {
                Text(current)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.buttonNormalPink)
                
                Text(yen)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
                    .padding(.bottom, 2)
            }
            .padding(.top, 6)
            
            HStack(spacing: 4) {
                Text("免稅價格")
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
                
                Text("每筆訂單限購20件")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .scaledToFit()
                
                Text("8小時27分 前訂購，最快可於 2023/04/17 13:00:00 取貨。（JR成田機場站）")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
            .padding(.top, 6)
        }
    }
}

struct ProductDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailTitleView()
    }
}
