//
//  ProductDetailItem.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/5.
//

import Foundation

public struct ProductDetailItem: Decodable {
    public let price: Int
    public let name: String
    public let description: String
    public let netContent: String
    public let ingredient: String
    public let images: [String]
}

//{
//  "price": 6500,
//  "name": "光采無瑕妝前凝霜 40g",
//  "description": "SPF25・PA++\n瞬間修飾肌膚暗沉與表面瑕疵，打造有如裸肌般細緻明亮的底妝。\n持久保濕不乾燥，每次使用皆能為肌膚帶來柔滑光感。",
//  "netContent": "40g",
//  "ingredient": "水、聚二甲基矽氧烷、丁二醇、異十六烷、甘油、氧化鈦、改性酒精、聚甲基倍半矽氧烷、PEG-9聚二甲基矽氧烷乙基聚二甲基矽氧烷、甲氧基肉桂酸乙基己酯、錦綸-12、三異硬脂、二硬脂二甲銨鋰蒙脫石 、十六烷基乙基己酸酯、二氧化矽、赤蘚糖醇、木糖醇、新戊酸異癸酯、苯基苯並咪唑磺酸、三甲基矽氧基矽酸鹽、海藻糖、PEG / PPG-14 / 7 二甲醚、甘氨酸、（聚二甲基矽氧烷 / 乙烯基聚二甲基矽氧烷）交聯聚合物、刺梨果萃取物、東當歸根萃取物、水解蠶絲、水解貝殼蛋白、紫蘇葉萃取物、TEA、異硬脂酸、氫氧化鋁、 硬脂酸、 EDTA-2Na、 BHT、 生育酚、 四氫四甲基環四矽氧烷、 三​​乙氧基辛基矽烷、 檸檬酸鈉、 十四碳烯、 茶氨酸、 檸檬酸鹽、 甲基丙烯酸甲酯交聯聚合物、 苯氧乙醇、 香精、 氧化鐵、 雲母、 硫酸鋇",
//  "images": [
//    "https://wa-kaimono-web-tokyo-development.s3.ap-northeast-1.amazonaws.com/gazou/products/4514254971888/4514254971888_01.jpg",
//    "https://wa-kaimono-web-tokyo-development.s3.ap-northeast-1.amazonaws.com/gazou/products/4514254971888/4514254971888_02.jpg"
//  ]
//}
