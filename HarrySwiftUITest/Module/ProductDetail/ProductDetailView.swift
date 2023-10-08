//
//  ProductDetailView.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/5.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    
    @StateObject var viewModel: ProductDetailViewModel
    private var productDetail: ProductDetailItem { viewModel.detail }
    
    var body: some View {
        VStack(spacing: 0) {
            ProductDetailAirportView()

            ScrollView {
                VStack(spacing: 0) {
                    makeProductImageTabView()
                    ProductDetailTitleView(viewModel: viewModel)
                    makeSeparator()
                    ProductDetailDescView(
                        title: "product_detail_title_product_desc".localised,
                        content: $viewModel.detail.description
                    )
                    makeSeparator()
                    ProductDetailDescView(
                        title: "product_detail_title_product_volume".localised,
                        content: $viewModel.detail.netContent
                    )
                    makeSeparator()
                    ProductDetailDescView(
                        title: "product_detail_title_product_ingredient".localised,
                        content: $viewModel.detail.ingredient
                    )
                }
                .padding([.leading, .trailing, .bottom])
            }
            
            ProductDetailAmountView(viewModel: viewModel)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: WANavBackButton())
        .navigationBarItems(trailing: makeNavBarButtons())
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func makeNavBarButtons() -> some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.trailing, 14)
            }
            
            Button(action: {}) {
                Image(systemName: "heart")
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
            }
            
            ZStack {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                        .padding(.trailing, 12)
                }
                
                if viewModel.cartAmount > 0 {
                    Text("\(viewModel.cartAmount)")
                        .font(.system(size: 10, weight: .medium))
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.waPink))
                        .offset(x: 10, y: -10)
                }
            }
        }
    }
    
    private func makeProductImageTabView() -> some View {
        
        let width = UIScreen.main.bounds.width
        let tabViewHeight = width + 20
        
        return TabView {
            ForEach(viewModel.detail.images, id: \.self) { imageUrlString in
                if let url = URL(string: imageUrlString) {
                    VStack {
                        KFImage(url)
                            .resizable()
                            .frame(
                                width: width,
                                height: width
                            )
                            .aspectRatio(1, contentMode: .fit)
                            .scaledToFit()
                        
                        Spacer()
                    }
                }
            }
        }
        .frame(height: tabViewHeight)
        .tabViewStyle(.page)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    }
    
    private func makeSeparator() -> some View {
        Divider()
            .background { Color.gray }
            .padding([.top, .bottom], 16)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel())
    }
}

