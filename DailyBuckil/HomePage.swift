//
//  HomePage.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import SwiftUI

struct HomePage: View {
    let weatherHow: Int = 0
    let todayData = Array(1...4).map{"Buckil\($0)"}
    let recentPurchase = Array(1...4).map{"Purchase\($0)"}
    let oneColumnGrid = [
        GridItem(.flexible())
    ]
    let twoColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var currentFont: String = fontlist.randomElement() ?? "Whisper-Regular.ttf"
    
    
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    LazyVStack(pinnedViews:[.sectionHeaders]) {
                        Section(header: HomePageNavigationBarView(weatherIndex: weatherHow, currentFont: self.$currentFont)){
                            VStack{
                                HStack {
                                    Text("Today's Buckil")
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(currentFont, size: 30))
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                    NavigationLink {
                                        ListView(currentFont: $currentFont)
                                            .navigationBarHidden(true)
                                    } label: {
                                        Image(systemName: "arrow.forward")
                                            .frame(width: 45, height: 45)
                                            .foregroundColor(Color("MainColor"))
                                    }
                                    

                                }
                                ScrollView(.horizontal){
                                    
                                    
                                    HStack(){
                                        ForEach(todayData, id: \.self) {i in
                                            NavigationLink {
                                                EmptyView()
                                            } label: {
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
                                
                                Divider()
                                Section(){
                                    HStack{
                                        Text("Recent Purchase")
                                            .foregroundColor(Color("MainColor"))
                                            .font(.custom(currentFont, size: 30))
                                            .padding(.horizontal)
                                            .padding(.vertical)
                                        Spacer()
                                    }
                                    LazyVGrid(columns: twoColumnGrid, spacing: 20){
                                        ForEach(recentPurchase, id: \.self) {i in
                                            VStack{
                                                Image(i)
                                                    .resizable()
                                                    .frame(height: 170)
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


