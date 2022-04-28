//
//  AppData.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import Foundation
import SwiftUI


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
