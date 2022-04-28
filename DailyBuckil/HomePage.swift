//
//  HomePage.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import SwiftUI

struct HomePage: View {
    let weatherhow:Int = 0
    let todaydata = Array(1...4).map{"Buckil\($0)"}
    let purchasedata = Array(1...4).map{"Purchase\($0)"}
    let columns1 = [
        GridItem(.flexible())
    ]
    let columns2 = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var fontnow: String = fontlist.randomElement() ?? "Whisper-Regular.ttf"
    @State var text: String = ""
    var body: some View {
        ZStack{
        ScrollView{
            LazyVStack(pinnedViews:[.sectionHeaders]) {
                Section(header: NavigationBarTitleSuperView(weatherindex: weatherhow, fontnow: self.$fontnow, text: self.$text)){
                    VStack{
                        HStack {
                            Text("Today's Buckil")
                                .foregroundColor(Color("MainColor"))
                                .font(.custom(fontnow, size: 30))
                                .padding(.horizontal)
                                .padding(.vertical)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            
                            Section(){
                                HStack(){
                                    ForEach(todaydata, id: \.self) {i in
                                        VStack{
                                            
                                            Image(i)
                                                .resizable()
                                                .frame(height: 300)
                                                .scaledToFit()
                                                .aspectRatio(1, contentMode: .fit)
                                            
                                            
                                        }
                                    }
                                    Image(systemName: "arrow.forward")
                                        
                                }
                            }
                            
                        }
                        
                        Divider()
                        Section(){
                            HStack{
                                Text("Recent Purchase")
                                    .foregroundColor(Color("MainColor"))
                                    .font(.custom(fontnow, size: 30))
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                Spacer()
                            }
                            LazyVGrid(columns: columns2, spacing: 20){
                                ForEach(purchasedata, id: \.self) {i in
                                    VStack{
                                        Image(i)
                                            .resizable()
                                            .frame(height: 200)
                                            .scaledToFit()
                                            .aspectRatio(1, contentMode: .fit)
                                        Text(i)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                }
                
            }
            
        }
        .clipped()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


