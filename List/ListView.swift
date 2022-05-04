//
//  ListView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    @Environment(\.presentationMode) var presentationMode
    // State variables. It will be passed to AppBarView as @Binding.
    @State var inputText = ""
    @State var seletedSeason = Season.all
    @State var dressup = false
    @State var selectedTPO = TPO.all
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
                                    .font(.custom(currentFont, size: 15))
                            }
                        }
                        .frame(height: 70.0)
                        .padding(.top, -57.0)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 100)
                    
                AppBarView(inputText: $inputText, seletedSeason: $seletedSeason, dressup: $dressup, selectedTPO : $selectedTPO, currentFont: $currentFont)
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
                        ForEach(viewModel.dailys
                            .filter({ daily in
                                filterSearchText(daily)
                            })
                                .filter({ daily in
                                    filterSeason(daily)
                                })
                                    .filter({daily in
                                        filterTPO(daily)
                                    })
                                        .filter({ daily in
                                            filterdressup(daily)
                                        }), id: \.self) { daily in
                                            DailyView(daily: daily)
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
    private func filterSearchText(_ daily: Daily) -> Bool {
        if inputText == "" || daily.name.localizedCaseInsensitiveContains(inputText) {
            return true
        } else {
            return false
        }
    }
    
    private func filterSeason(_ daily: Daily) -> Bool {
        if seletedSeason == .all || daily.type.contains(seletedSeason)
        {
            return true
        } else {
            return false
        }
    }
    
    private func filterdressup(_ daily: Daily) -> Bool {
        if !dressup || daily.dress == "꾸꾸꾸" {
            return true
        } else {
            return false
        }
    }
    
    private func filterTPO(_ daily: Daily) -> Bool{
        if selectedTPO == .all || daily.tagsTPO.contains(selectedTPO)
        {
            return true
        } else {
            return false
        }
    }
    
}

