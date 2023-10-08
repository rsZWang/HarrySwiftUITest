//
//  ProductDetailView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/5.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    
    let airportList = Bundle.main.decode(ProductDetailItem.self, from: "product_detail.json")
    
    var colors: [Color] = [ .orange, .green, .yellow, .pink, .purple ]
    var emojis: [String] = [ "👻", "🐱", "🦊" , "👺", "🎃"]
    
    var body: some View {
        VStack(spacing: 0) {
            ProductDetailAirportView()

            ScrollView {
                VStack(spacing: 0) {
                    makeProductImageTabView()
                    ProductDetailTitleView()
                    makeSeparator()
                    ProductDetailDescView(
                        title: "商品說明",
                        content: "SPF25・PA++\n瞬間修飾肌膚暗沉與表面瑕疵，打造有如裸肌般細緻明亮的底妝。\n持久保濕不乾燥，每次使用皆能為肌膚帶來柔滑光感。"
                    )
                    makeSeparator()
                    ProductDetailDescView(
                        title: "內容量",
                        content: "40g"
                    )
                    makeSeparator()
                    ProductDetailDescView(
                        title: "成分/原材料",
                        content: "水、聚二甲基矽氧烷、丁二醇、異十六烷、甘油、氧化鈦、改性酒精、聚甲基倍半矽氧烷、PEG-9聚二甲基矽氧烷乙基聚二甲基矽氧烷、甲氧基肉桂酸乙基己酯、錦綸-12、三異硬脂、二硬脂二甲銨鋰蒙脫石 、十六烷基乙基己酸酯、二氧化矽、赤蘚糖醇、木糖醇、新戊酸異癸酯、苯基苯並咪唑磺酸、三甲基矽氧基矽酸鹽、海藻糖、PEG / PPG-14 / 7 二甲醚、甘氨酸、（聚二甲基矽氧烷 / 乙烯基聚二甲基矽氧烷）交聯聚合物、刺梨果萃取物、東當歸根萃取物、水解蠶絲、水解貝殼蛋白、紫蘇葉萃取物、TEA、異硬脂酸、氫氧化鋁、 硬脂酸、 EDTA-2Na、 BHT、 生育酚、 四氫四甲基環四矽氧烷、 三​​乙氧基辛基矽烷、 檸檬酸鈉、 十四碳烯、 茶氨酸、 檸檬酸鹽、 甲基丙烯酸甲酯交聯聚合物、 苯氧乙醇、 香精、 氧化鐵、 雲母、 硫酸鋇"
                    )
                }
                .padding([.leading, .trailing, .bottom])
            }
            
            ProductDetailAmountView()
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
            
            Button(action: {}) {
                Image(systemName: "cart")
                    .foregroundColor(.black)
                    .padding(.trailing, 12)
            }
        }
    }
    
    private func makeProductImageTabView() -> some View {
        
        let width = UIScreen.main.bounds.width
        let tabViewHeight = width + 20
        
        return TabView {
            ForEach(airportList.images, id: \.self) { imageUrlString in
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
        ProductDetailView()
    }
}

