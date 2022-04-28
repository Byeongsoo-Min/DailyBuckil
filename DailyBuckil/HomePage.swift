//
//  HomePage.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import SwiftUI

struct HomePage: View {
//    @State var Weathercolor = AppData.Weather_color
//    var Weather_what:Weather = .Snow
    var body: some View {
        VStack {
            
            Text("Daily Buckil")
                .fontWeight(.bold)
            
            NavigationBarTitleSuperView(weather: 0)
            NavigationBarTitleSuperView(weather: 1)
            NavigationBarTitleSuperView(weather: 2)
            NavigationBarTitleSuperView(weather: 3)
            
//            if (Weather_what == .Sunny){
//                HStack() {
//                    Text("Daily Buckil")
//                        .fontWeight(.bold)
//                    Image(systemName: "sun.max")
//                    Text("23°")
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                .frame(width: .infinity, alignment: .topLeading)
//                .padding()
//                .foregroundColor(Weathercolor[0])
//                .font(.title2)
//                Spacer()
//            }
//            else if (Weather_what == .Cloudy){
//                HStack(){
//                    Text("Daily Buckil")
//                        .fontWeight(.bold)
//                    Image(systemName: "cloud.fill")
//                    Text("23°")
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                .frame(width: .infinity, alignment: .topLeading)
//                .padding()
//                .foregroundColor(Weathercolor[1])
//                .font(.title2)
//                Spacer()
//            }
//            else if (Weather_what == .Rainy){
//                HStack(){
//                    Text("Daily Buckil")
//                        .fontWeight(.bold)
//                    Image(systemName: "cloud.heavyrain.fill")
//                    Text("23°")
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                .frame(width: .infinity, alignment: .topLeading)
//                .padding()
//                .foregroundColor(Weathercolor[2])
//                .font(.title2)
//                Spacer()
//            }
//            else{
//                HStack(){
//                    Text("Daily Buckil")
//                        .fontWeight(.bold)
//                    Image(systemName: "snowflake")
//                    Text("23°")
//                        .fontWeight(.bold)
//                    Spacer()
//                }
//                .frame(width: .infinity, alignment: .topLeading)
//                .padding()
//                .foregroundColor(Weathercolor[3])
//                .font(.title2)
//                Spacer()
//            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


