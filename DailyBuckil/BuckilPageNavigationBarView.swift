//
//  BuckilPageNavigationBarView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/04.
//

import SwiftUI

struct BuckilPageNavigationBarView: View {
    @Binding var currentFont: String
    var Item:Daily
    var body: some View {
        VStack{
            
            Text("Daily Buckil")
                .font(.custom(currentFont, size: 25))
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
            HStack() {
                Spacer()
                Text("The Weather then")
                    .fontWeight(.bold)
                Image(systemName: Weather(weather: Item.weatherCode).image)
                Text(String(Item.weatherThen))
                    .fontWeight(.bold)
                Spacer()
            }
//            .frame(width: .infinity, alignment: .topLeading)
            .padding()
            .foregroundColor(Weather(weather: Item.weatherCode).color)
            .font(.custom(currentFont, size: 20))
            
        }
        .background(.white)
    }
    
    
}
