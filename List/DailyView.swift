//
//  StoreView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import SwiftUI

struct DailyView: View {
    let daily: Daily
    
    var body: some View {
        VStack {
            Image(daily.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width-50, height: 200, alignment: .center)
                .clipped()
            
            
            VStack {
                HStack {
                    Text(daily.name)
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 0) {
                    Image("dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.yellow)
                    Text(String(daily.money))
                        .padding(.trailing)
//                    Text(store.type.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 1)
                ScrollView(.horizontal) {
                HStack {
                    ForEach(daily.tagsTPO, id: \.self) { tag in
                        Text(tag.rawValue)
                            .encapulate(color: .black.opacity(0.8), foregroundColor : .white)
                    }
                    Spacer()
                }
                .padding(.bottom)
                }
            }
            .frame(width: UIScreen.main.bounds.width-50)
        }
    }
}

