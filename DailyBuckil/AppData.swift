//
//  AppData.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import Foundation
import SwiftUI


struct Purchase: Codable, Hashable{
    let type: [ClothesType]
    let imageURL: String
    let name: String
    let money: Int
    var tagsTPO: [TPO]
    var tagsSeason: [String]
    
    enum CodingKeys: String, CodingKey{
        case imageURL, name, money, tagsTPO, tagsSeason
        case type = "clothesType"
    }
    
}

enum ClothesType: String, Codable, CaseIterable{
    case all = "전체"
    case outer = "outer"
    case semiouter = "semiouter"
    case top = "top"
    case pants = "pants"
    case shoes = "shoes"
    case cap = "cap"
    case glasses = "glasses"
    case belt = "belt"
    case socks = "socks"
    case accessories = "accessories"

}


struct Daily: Codable, Hashable {
    let type: [Season]
    let imageURL: String
    let name: String
    let location: String
    let money: Double
    let dress: String
    var tagsTPO: [TPO]
    var tagsSeason: [String]
    var tagsAge: Age
    var weatherThen: Double
    var weatherCode: Int
    var clothes : [String]
    var bestClothes: [Int]
    
    
    //clothes = ["outer", "semiouter", "top", "pants", "shoes", "cap", "glasses", "belt", "socks", "accessories"]
    enum CodingKeys: String, CodingKey {
        case imageURL, name, location, money, tagsSeason, tagsAge, dress, weatherThen, weatherCode, clothes, bestClothes
        case type = "season"
        case tagsTPO = "tagsTPO"
    }
    
}

enum Season: String, Codable, CaseIterable {
    case all = "전체"
    case spring = "봄"
    case summer = "여름"
    case fall = "가을"
    case winter = "겨울"
    case wintertospring = "초봄"
    case springtosummer = "초여름"
    case summertofall = "초가을"
    case falltowinter = "초겨울"
}

enum TPO: String, Codable, CaseIterable{
    case all = "전체"
    case datinglook = "데이트룩"
    case freshmenlook = "새내기룩"
    case campuslook = "캠퍼스룩"
    case casuallook = "캐주얼룩"
    case onemilewear = "동네마실룩"
}

enum Age: String, Codable, CaseIterable{
    case all = "전체"
    case teens = "10대"
    case twenties = "20대"
    case thirties = "30대"
    case forties = "40대"
}

//func getWeatherIndex(){
//
//}

struct Weather {
    let weather: Int
    var image: String
    var color: Color
    
    init(weather: Int) {
        self.weather = weather
        self.image = WeatherImage[weather]
        self.color = WeatherColor[weather]
    }
    
    let WeatherImage: [String] = ["sun.max", "cloud.fill", "cloud.heavyrain.fill", "snowflake"]
    let WeatherColor: [Color] = [.orange, .indigo, .blue, .gray]
    
}

let fontlist: [String] = ["Lobster-Regular",
                          "BebasNeue-Regular",
                          "ShadowsIntoLight-Regular",
                          "OleoScriptSwashCaps-Regular"]


struct TodayData {
    let todayData = Array(1...6).map{"Buckil\($0)"}
    
}

struct RecentPurchase {
    let recentPurchase = Array(1...6).map{"Purchase\($0)"}
    
    
}
