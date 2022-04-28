//
//  NavigationBarTitleSuperView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/28.
//

import SwiftUI

struct NavigationBarTitleSuperView: View {
    let weather: Int
    
    var body: some View {
        HStack() {
            Text("Daily Buckil")
                .fontWeight(.bold)
            Image(systemName: Weather(weather: weather).image)
            Text("23°")
                .fontWeight(.bold)
            Spacer()
        }
        .frame(width: .infinity, alignment: .topLeading)
        .padding()
        .foregroundColor(Weather(weather: weather).color)
        .font(.title2)
    }
    
    
}

//struct NavigationBarTitleSuperView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBarTitleSuperView()
//    }
//}
