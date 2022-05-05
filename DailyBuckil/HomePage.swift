//
//  HomePage.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/27.
//

import SwiftUI

struct HomePage: View {
    var weatherHow: Int = 0
    let todayData = Array(1...4).map{"Buckil\($0)"}
    let recentPurchase = Array(1...4).map{"Purchase\($0)"}
    let oneColumnGrid = [
        GridItem(.flexible())
    ]
    let twoColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var dailys = ListViewModel().dailys
    @ObservedObject var viewModel = PurchaseListViewModel()
    @State var currentFont: String = fontlist.randomElement() ?? "Montserrat-Black"
    @EnvironmentObject var network: Network
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView{
                    LazyVStack(pinnedViews:[.sectionHeaders]) {
                        Section(header: HomePageNavigationBarView(currentFont: self.$currentFont)
                            .environmentObject(Network())){
                            VStack{
                                HStack {
                                    Text("Today's Buckil")
                                        .foregroundColor(Color("MainColor"))
                                        .font(.custom(currentFont, size: 24))
                                        .frame(height: 24, alignment: .leading)
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                    Spacer()
                                    NavigationLink {
                                        ListView(currentFont: $currentFont)
                                            .navigationBarHidden(true)
                                    } label: {
                                        Image(systemName: "arrow.forward")
                                            .frame(width: 45, height: 30)
                                            .foregroundColor(Color("MainColor"))
                                    }
                                    

                                }
                                ScrollView(.horizontal){
                                    
                                    
                                    HStack(){
                                        ForEach(dailys.indices, id: \.self) { index in
                                            NavigationLink {
//                                                EmptyView()
                                                BuckilPage(item: dailys[index], currentFont: $currentFont)
                                            } label: {
                                                Image("Buckil\(index+1)")
                                                    .resizable()
                                                    .frame(height: 300)
                                                    .scaledToFit()
                                                    .clipped()
                                                    .aspectRatio(1, contentMode: .fill)
                                                
                                            }
                                            }
                                    }
                                }
                                
                                Divider()
                                Section(){
                                    HStack{
                                        Text("Recent Purchase")
                                            .foregroundColor(Color("MainColor"))
                                            .font(.custom(currentFont, size: 24))
                                            .padding(.horizontal)
                                            .padding(.vertical)
                                        Spacer()
                                        NavigationLink {
                                            PurchaseListView(currentFont: $currentFont)
                                                .navigationBarHidden(true)
                                        } label: {
                                            Image(systemName: "arrow.forward")
                                                .frame(width: 45, height: 30)
                                                .foregroundColor(Color("MainColor"))
                                        }
                                    }
                                    LazyVGrid(columns: twoColumnGrid, spacing: 20){
                                        ForEach(viewModel.purchase, id: \.self) {i in
                                            VStack{
                                                Button(action: {
                                                    self.showModal = true
                                                }){
                                                    Image(i.imageURL)
                                                        .resizable()
                                                        .frame(height: 170)
                                                        .scaledToFit()
                                                        .aspectRatio(1, contentMode: .fit)
                                                }
                                                .sheet(isPresented: self.$showModal) {
                                                    MyWebView(urlToLoad: i.link)
                                                } //Button 끝
                                                
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


