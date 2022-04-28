//
//  NavigationBarTitleSuperView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/28.
//

import SwiftUI

struct NavigationBarTitleSuperView: View {
    let weatherindex: Int
    @Binding var fontnow:String
    @Binding var text: String
    var body: some View {
        VStack{
            Text("Daily Buckil")
                .font(.custom(fontnow, size: 40))
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
            HStack() {
                Text("Today's Weather")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: Weather(weather: weatherindex).image)
                Text("23°")
                    .fontWeight(.bold)
                
            }
            .frame(width: .infinity, alignment: .topLeading)
            .padding()
            .foregroundColor(Weather(weather: weatherindex).color)
            .font(.custom(fontnow, size: 30))
            searchBar(text: self.$text)
        }
        .background(.white)
        
        Divider()
        
    }
    
    
}

//struct NavigationBarTitleSuperView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationBarTitleSuperView()
//    }
//}
