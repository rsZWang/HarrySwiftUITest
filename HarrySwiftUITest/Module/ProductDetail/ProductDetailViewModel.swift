//
//  ProductDetailViewModel.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/8.
//

import SwiftUI
import Combine

class ProductDetailViewModel: ObservableObject {
    
    @Published var detail: ProductDetailItem = .empty
    @Published var isLiked: Bool = false
    @Published var amount: Int = 0
    @Published var cartAmount: Int = 0
    @AppStorage("liked") private var liked = false
    
    var titleItem: ProductDetailTitleViewItem {
        detail.toProductDetailViewItem(currency: "NT$")
    }

    init() {
        detail = Bundle.main.decode(ProductDetailItem.self, from: "product_detail.json")
        isLiked = liked
        
        // Uncomment for try API calling simulation
//        fetchProductDetail()
    }
    
    // Simulation for API calling
    private func fetchProductDetail() {
        Task {
            try await Task.sleep(nanoseconds: 3 * 1_000_000_000)
            let detail = Bundle.main.decode(ProductDetailItem.self, from: "product_detail.json")
            let isLikded = liked
            await MainActor.run {
                self.detail = detail
                self.isLiked = isLikded
            }
        }
    }
    
    func toggleLike() {
        isLiked.toggle()
        liked = isLiked
    }
    
    func plusAmount() {
        amount += 1
    }
    
    func minusAmount() {
        amount -= 1
    }
    
    func putInCart() {
        cartAmount += amount
        amount = 0
    }
}
