//
//  ContentView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    var temp: String { String(format: "%.1f", (network.weather.main.temp - 273.15)) }
    var description: String { network.weather.weather.first?.weatherDescription ?? "" }
    
    var body: some View {
        VStack {
            Text("습도: \(network.weather.main.humidity)")
                .padding()
            Text("기온: \(temp)")
            Text("description: \(description)")
        }
        .onAppear {
            network.getWeather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
