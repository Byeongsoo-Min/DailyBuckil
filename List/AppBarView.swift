//
//  AppBarView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import SwiftUI

struct AppBarView: View {
    @EnvironmentObject var viewModel: ListViewModel
    
    // var deciding whether show search bar or not.
    @State var showSearchBar = false
    @State var items: [String] = ["데이트룩", "새내기룩", "캠퍼스룩", "캐주얼룩", "동네마실룩"]
    @State var selections: [String] = []
    // Got from ListView
    @Binding var inputText: String
    @Binding var seletedSeason: Season
    @Binding var dressup: Bool
    @Binding var selectedTPO: TPO
    @Binding var currentFont: String
    //    @Binding var selected
    
    // Search bar textfield
    var SearchBarView: some View {
        VStack {
            TextField("Enter the keyword", text: $inputText)
                .padding(5)
                .font(.custom(currentFont, size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
        }
    }
    
    var body: some View{
        
        VStack {
            HStack {
                Spacer()
                
                // Search bar
                if showSearchBar {
                    SearchBarView
                        .transition(.move(edge: .top))
                } else {
                    Text("Daily Buckil")
                        .foregroundColor(Color("MainColor"))
                        .font(.custom(currentFont, size: 20))
                        .bold()
                }
                
                Spacer()
                
                // Search button to show search bar
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showSearchBar.toggle()
                            inputText = ""
                        }
                    }
            }
            .font(.custom(currentFont, size: 25))
            .frame(height: 50)
            
            // Sort options
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    Text(viewModel.nameSort.rawValue)
                        .encapulate(borderColor: .gray)
                        .onTapGesture {
                            if (viewModel.nameSort == .nameASC){
                                viewModel.nameSort = .nameDESC
                            } else {
                                viewModel.nameSort = .nameASC
                            }
                            viewModel.sortList(by: viewModel.nameSort)
                        }
                    Text(viewModel.ratingSort.rawValue)
                        .encapulate(borderColor: .gray)
                        .onTapGesture {
                            if (viewModel.ratingSort == .ratingASC){
                                viewModel.ratingSort = .ratingDESC
                            } else {
                                viewModel.ratingSort = .ratingASC
                            }
                            viewModel.sortList(by: viewModel.ratingSort)
                        }
                    
                    Picker(seletedSeason.rawValue,
                           selection: $seletedSeason) {
                        ForEach(Season.allCases, id: \.self) { value in
                            if(value.rawValue == "전체"){
                                Text("계절: \(value.rawValue)")
                                    .tag(value)
                            }
                            else{
                                Text("\(value.rawValue)")
                                    .tag(value)
                            }
                        }
                        
                    }
                           .colorMultiply(.black)
                           .pickerStyle(.menu)
                           .padding(.vertical, -5)
                           .encapulate(borderColor: .gray)
                           
                    Picker(selectedTPO.rawValue, selection: $selectedTPO){
                        ForEach(TPO.allCases, id: \.self) { value in
                            if(value.rawValue == "전체"){
                                Text("TPO: \(value.rawValue)")
                                    .font(.custom("Pretendard-Bold.otf", size: 7))
                                    .tag(value)
                            }
                            else{
                                Text("\(value.rawValue)")
                                    .font(.custom("Pretendard-Bold.otf", size: 7))
                                    .tag(value)
                            }
                        }
                    }
                    .colorMultiply(.black)
                    .pickerStyle(.menu)
                    .padding(.vertical, -5)
                    .encapulate(borderColor: .gray)
                    
                    if dressup {
                        Text("오늘은 힘 좀 줘볼까")
                            .encapulate(color: .blue.opacity(0.8), foregroundColor: .white)
                            .onTapGesture {
                                dressup.toggle()
                            }
                    } else {
                        Text("오늘은 힘 좀 줘볼까")
                            .encapulate(borderColor: .gray)
                            .onTapGesture {
                                dressup.toggle()
                            }
                    }
                }
                .padding(.vertical, 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }
    
}
