//
//  NavigationBarTitleSuperView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/28.
//

import SwiftUI

struct HomePageNavigationBarView: View {
    @Binding var currentFont: String
    @EnvironmentObject var network: Network
    var temparature: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var description: String { network.weather.weather.first?.weatherDescription ?? "" }
    var weatherIndex: Int {getWeatherIndex(weatherdescription: description)}
    var body: some View {
        VStack{
            
            Text("Daily Buckil")
                .font(.custom(currentFont, size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
                .frame(height: 40, alignment: .center)
            HStack() {
                Text("Today's Weather")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: Weather(weather: weatherIndex).image)
                Text(temparature)
                    .fontWeight(.bold)
                
            }
//            .frame(width: .infinity, alignment: .topLeading)
            .padding()
            .foregroundColor(Weather(weather: weatherIndex).color)
            .font(.custom(currentFont, size: 30))
            .frame(height: 30)
            .padding(.vertical)
        }
        .onAppear {
            network.getWeather()
        }
        .background(.white)
        
        Divider()
        
    }
    
    
}
