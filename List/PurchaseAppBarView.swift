//
//  PurchaseAppBarView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/05.
//

import SwiftUI

struct PurchaseAppBarView: View {
    @EnvironmentObject var viewModel: PurchaseListViewModel
    
    // var deciding whether show search bar or not.
    @State var showSearchBar = false
    @State var items: [String] = ["데이트룩", "새내기룩", "캠퍼스룩", "캐주얼룩", "동네마실룩"]
    @State var selections: [String] = []
    // Got from ListView
    @Binding var inputText: String
    @Binding var seletedClothes: ClothesType
    @Binding var selectedSeason: Season
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
                    
                    Picker(seletedClothes.rawValue,
                           selection: $seletedClothes) {
                        ForEach(ClothesType.allCases, id: \.self) { value in
                            if(value.rawValue == "전체"){
                                Text("옷 종류: \(value.rawValue)")
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
                    
                    
                    Picker(selectedSeason.rawValue, selection: $selectedSeason){
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
                }
                .padding(.vertical, 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 100)
    }
    
}
