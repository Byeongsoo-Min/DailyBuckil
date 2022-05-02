//
//  AppData.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import Foundation
import SwiftUI


struct Daily: Codable, Hashable {
    let type: Season
    let imageURL: String
    let name: String
    let location: String
    let rating: Double
    var tagsTPO: [String]
    var tagsSeason: [String]
    var tagsAge: [String]
    
    enum CodingKeys: String, CodingKey {
        case imageURL, name, location, rating, tagsTPO, tagsSeason, tagsAge
        case type = "season"
    }
}

enum Season: String, Codable, CaseIterable {
    case all = "all"
    case spring = "spring"
    case summer = "summer"
    case fall = "fall"
    case winter = "winter"
    case wintertospring = "wintertospring"
    case springtosummer = "q"
    case summertofall = "w"
    case falltowinter = "e"
}




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

let fontlist:[String] = ["Lobster-Regular", "BebasNeue-Regular", "ShadowsIntoLight-Regular", "Montserrat-Italic-VariableFont_wght", "Montserrat-VariableFont_wght"]


//struct AppData{
//    var Today_weather : Weather = Weather.Sunny
//    static var Weather_color: [Color] = [.orange, .indigo, .blue, .gray]
//
//}
//func HowIsWeather(Weather_what:Weather, weather_case:Int){
//    var weather_case = weather_case
//    switch Weather_what {
//    case .Sunny:
//        weather_case = 1
//    case .Cloudy:
//        weather_case = 2
//    case .Rainy:
//        weather_case = 3
//    case .Snow:
//        weather_case = 4
//    }
//
//}
