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
                .frame(height: 25, alignment: .center)
            HStack() {
                Spacer()
                Text("The Weather then")
                    .fontWeight(.bold)
                Image(systemName: Weather(weather: Item.weatherCode).image)
                Text(String(Item.weatherThen))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .foregroundColor(Weather(weather: Item.weatherCode).color)
            .font(.custom(currentFont, size: 20))
            .frame(height: 20)
            .padding(.vertical)
        }
        .background(.white)
    }
    
    
}
