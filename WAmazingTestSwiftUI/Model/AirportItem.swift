//
//  AirportItem.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/4.
//

import Foundation

public struct Airports: Decodable {
    public let airports: [AirportItem]
}

public struct AirportItem: Decodable, Identifiable {
    public var id: String { code }
    public let code: String
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}

//{"airports":[{"code":"NRT","name":"成田國際機場"},{"code":"NGO","name":"中部國際機場　新特麗亞"},{"code":"KIX","name":"關西國際機場"},{"code":"AKJ","name":"旭川機場"},{"code":"CTS","name":"新千歲機場"},{"code":"HKD","name":"函館機場"},{"code":"AOJ","name":"青森機場"},{"code":"AXT","name":"秋田機場"},{"code":"KIJ","name":"新潟機場"},{"code":"IBR","name":"茨城機場"},{"code":"SDJ","name":"仙台國際機場"},{"code":"FSZ","name":"富士山靜岡機場"},{"code":"YGJ","name":"米子機場"},{"code":"HIJ","name":"廣島機場"},{"code":"OKJ","name":"岡山機場"},{"code":"KMQ","name":"小松機場"},{"code":"KKJ","name":"北九州機場"},{"code":"KOJ","name":"鹿兒島機場"},{"code":"OKA","name":"那霸機場"},{"code":"SHI","name":"下地島機場"}]}
