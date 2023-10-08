//
//  ProductDetailDescView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/7.
//

import SwiftUI

struct ProductDetailDescView: View {
    
    @State private var isExpanded = false
    @State private var truncated = false
    
    var title: String
    var content: String
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(content)
                    .lineLimit(isExpanded ? nil : 3)
                    .background(GeometryReader { geometry in
                        Color.clear.onAppear {
                            determineTruncation(geometry)
                        }
                    })
                
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
                                    Text("關閉")
                                        .font(.system(size: 18))
                                        .foregroundColor(.buttonNormalPink)
                                    
                                    Text(Image(systemName: "chevron.up"))
                                        .font(.system(size: 18))
                                        .foregroundColor(.buttonNormalPink)
                                }
                            } else {
                                Text("看更多")
                                    .font(.system(size: 18))
                                    .foregroundColor(.buttonNormalPink)
                            }
                        }
                    }
                }
            }
            
            if !truncated {
                Spacer()
            }
        }
    }
    
    private func determineTruncation(_ geometry: GeometryProxy) {
        let total = title.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        )
        truncated = geometry.size.height > total.size.height
    }
}

struct ProductDetailDescView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailDescView(
            title: "商品說明",
            content: "SPF25・PA++\n瞬間修飾肌膚暗沉與表面瑕疵，打造有如裸肌般細緻明亮的底妝。\n持久保濕不乾燥，每次使用皆能為肌膚帶來柔滑光感。"
        )
    }
}
