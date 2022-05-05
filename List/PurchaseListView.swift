//
//  PurchaseListView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/05.
//

import Foundation
import SwiftUI

struct PurchaseListView: View {
    @ObservedObject var viewModel = PurchaseListViewModel()
    @Environment(\.presentationMode) var presentationMode
    // State variables. It will be passed to AppBarView as @Binding.
    @State var inputText = ""
    @State var seletedClothes = ClothesType.all
    @State var selectedTPO = TPO.all
    @State var selectedSeason = Season.all
    
    @Binding var currentFont: String
    var body: some View {
        NavigationView {
            VStack {
                // App bar above the list view which contains search, sort options
                ZStack{
                    HStack{
                        Button (action: {
                            goBack()
                        }) {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color("MainColor"))
                                Text ("Back")
                                    .foregroundColor(Color("MainColor"))
                                    .font(.custom(currentFont, size: 18))
                            }
                        }
                        .frame(height: 70.0)
                        .padding(.top, -57.0)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 100)
                    
                    PurchaseAppBarView(inputText: $inputText, seletedClothes: $seletedClothes, selectedSeason: $selectedSeason, selectedTPO : $selectedTPO, currentFont: $currentFont)
                    .environmentObject(viewModel)
                    .padding(.bottom, 5)
                    .overlay(Divider()
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color.black), alignment: .bottom)
                    .padding(.bottom, 5)
                }
                // List of stores
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.purchase
                            .filter({ purchase in
                                filterSearchText(purchase)
                            })
                                .filter({ purchase in
                                    filterClothes(purchase)
                                })
                                    .filter({purchase in
                                        filterTPO(purchase)
                                    })
                                        .filter({ purchase in
                                            filterSeason(purchase)
                                        }), id: \.self) { purchase in
                                            PurchaseView(purchase: purchase)
                                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        
    }
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
    // Filter helper functions
    private func filterSearchText(_ purchase: Purchase) -> Bool {
        if inputText == "" || purchase.name.localizedCaseInsensitiveContains(inputText) {
            return true
        } else {
            return false
        }
    }
    
    private func filterClothes(_ purchase: Purchase) -> Bool {
        if seletedClothes == .all || purchase.type.contains(seletedClothes)
        {
            return true
        } else {
            return false
        }
    }
    private func filterSeason(_ purchase: Purchase) -> Bool {
        if selectedSeason == .all || purchase.tagsSeason.contains(String(selectedSeason.rawValue))
        {
            return true
        } else {
            return false
        }
    }
    
    private func filterTPO(_ purchase: Purchase) -> Bool{
        if selectedTPO == .all || purchase.tagsTPO.contains(selectedTPO)
        {
            return true
        } else {
            return false
        }
    }
    
}

