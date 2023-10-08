//
//  ProductDetailDescView.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/7.
//

import SwiftUI

struct ProductDetailDescView: View {
    
    @State private var isExpanded = false
    @State private var truncated = false
    
    var title: String
    @Binding var content: String
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                
                if content.count > 0 {
                    Text(content)
                        .font(.system(size: 16))
                        .lineLimit(isExpanded ? nil : 3)
                        .background(GeometryReader { geometry in
                            Color.clear.onAppear {
                                determineTruncation(geometry)
                            }
                        })
                }
                
                if truncated {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            if isExpanded {
                                HStack(spacing: 6) {
                                    Text("product_detail_button_close".localised)
                                        .font(.system(size: 18))
                                    
                                    Text(Image(systemName: "chevron.up"))
                                        .font(.system(size: 18))
                                }
                            } else {
                                Text("product_detail_button_more".localised)
                                    .font(.system(size: 18))
                            }
                        }
                        .foregroundColor(.buttonNormalPink)
                    }
                }
            }
            
            if !truncated {
                Spacer()
            }
        }
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
        let total = content.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        )
        truncated = (total.size.height > geometry.size.height)
    }
}

struct ProductDetailDescView_Previews: PreviewProvider {
    
    @State static var content = ""
    
    static var previews: some View {
        ProductDetailDescView(
            title: "商品說明",
            content: $content
        )
    }
}
