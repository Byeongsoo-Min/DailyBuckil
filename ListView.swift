//
//  ListView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    
    // State variables. It will be passed to AppBarView as @Binding.
    @State var inputText = ""
    @State var seletedSeason = Season.all
    @State var isOnSale = false
    
    var body: some View {
        VStack {
            // App bar above the list view which contains search, sort options
            AppBarView(inputText: $inputText, seletedSeason: $seletedSeason, isOnSale: $isOnSale)
                .environmentObject(viewModel)
                .padding(.bottom, 5)
                .overlay(Divider()
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.black), alignment: .bottom)
                .padding(.bottom, 5)
            
            // List of stores
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.dailys
                        .filter({ store in
                            (filterSearchText(store) && filterSeason(store) && filterOnSale(store)) || filter
})
                            .filter({ store in
                                filterSeason(store)
                            })
                                .filter({ store in
                                    filterOnSale(store)
                                }), id: \.self) { store in
                                    StoreView(store: store)
                                }
                }
            }
        }
    }
    
    // Filter helper functions
    private func filterSearchText(_ store: Daily) -> Bool {
        if inputText == "" || store.name.localizedCaseInsensitiveContains(inputText) {
            return true
        } else {
            return false
        }
    }
    
    private func filterSeason(_ store: Daily) -> Bool {
        if seletedSeason == .all || store.type.contains(seletedSeason)
        {
            return true
        } else {
            return false
        }
    }
    
    private func filterOnSale(_ store: Daily) -> Bool {
        if !isOnSale || store.tagsTPO.firstIndex(of: "꾸꾸꾸") != nil {
            return true
        } else {
            return false
        }
    }
}
