//
//  extensions.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import Foundation
import SwiftUI
import CoreLocation

extension View {
    func encapulate(color: Color, foregroundColor: Color = .black) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .background(Capsule().fill(color))
            .foregroundColor(foregroundColor)
    }
    
    func encapulate(borderColor: Color) -> some View {
        return self
            .padding(7)
            .padding(.horizontal, 5)
            .overlay(Capsule().stroke(borderColor))
    }
}


let appid = "96342d2ddb57e5bdc8be2eb6cac5e8aa"
let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(appid)&units=metric"
extension URL {
    //도시 이름을 통해 날씨 정보를 가져오는  GET Rest API
   static func urlWith(city: String) -> URL? {
        return URL(string: "\(weatherURL)&q=\(city)")
    }
    //위치 값을 통해 날씨 정보를 가져오는  GET Rest API
    static func urlWith(coordinate : CLLocationCoordinate2D) -> URL? {
        let urlString = "\(weatherURL)&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)"
        print(urlString)
        return URL(string: urlString)
    }
    
}

