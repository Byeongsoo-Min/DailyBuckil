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
  
    // Got from ListView
    @Binding var inputText: String
    @Binding var seletedSeason: Season
    @Binding var isOnSale: Bool
     
  
    // Search bar textfield
    var SearchBarView: some View {
        VStack {
            TextField("검색어를 입력하세요", text: $inputText)
                .padding(5)
                .font(.system(size: 15))
                .textFieldStyle(.roundedBorder)
                .shadow(radius: 3)
        }
    }
    
    var body: some View{
        VStack {
            HStack {
                // Doing nothing. Just for decoration
                Image(systemName: "ellipsis")
                Spacer()
                
                // Search bar
                if showSearchBar {
                    SearchBarView
                        .transition(.move(edge: .top))
                } else {
                    Text("Daily Buckil")
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
            .font(.system(size: 25))
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
                            Text(value.rawValue)
                                .tag(value)
                        }
                    }
                    .colorMultiply(.black)
                    .pickerStyle(.menu)
                    .padding(.vertical, -5)
                    .encapulate(borderColor: .gray)
                    
                    if isOnSale {
                        Text("오늘은 힘 좀 줘볼까")
                            .encapulate(color: .blue.opacity(0.8), foregroundColor: .white)
                            .onTapGesture {
                                isOnSale.toggle()
                            }
                    } else {
                        Text("오늘은 힘 좀 줘볼까")
                            .encapulate(borderColor: .gray)
                            .onTapGesture {
                                isOnSale.toggle()
                            }
                    }
                }
                .padding(.vertical, 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }
}
