//
//  Weather.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/02.
//

import Foundation

struct Welcome: Codable {
    let coord: Coord
    let weather: [Weather2]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    static let sample = Welcome(
        coord: Coord(lon: 0, lat: 0),
        weather: [Weather2](),
        base: "",
        main: Main(temp: 273.15, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, humidity: 0, seaLevel: 0, grndLevel: 0),
        visibility: 0,
        wind: Wind(speed: 0, deg: 0, gust: 0),
        clouds: Clouds(all: 0),
        dt: 0,
        sys: Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0),
        timezone: 0,
        id: 0,
        name: "",
        cod: 0)
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather2: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

func getWeatherIndex(weatherdescription:String) -> Int{
    if (weatherdescription.contains("rain")){
        return 2
    }
    else if (weatherdescription.contains("sunny")){
        return 0

    }
    else if(weatherdescription.contains("cloud")){
        return 1
    }
    else if(weatherdescription.contains("snow")){
        return 3
    }
    else{
        return 1
    }
}
