//
//  StoreView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/30.
//

import SwiftUI

struct StoreView: View {
    let store: Daily
    
    var body: some View {
        VStack {
            Image(store.imageURL)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width-50, height: 200)
                .clipped()
            
            
            VStack {
                HStack {
                    Text(store.name)
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
                    Text(String(store.rating))
                        .padding(.trailing)
//                    Text(store.type.rawValue)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom, 1)
                ScrollView(.horizontal) {
                HStack {
                    ForEach(store.tagsTPO, id: \.self) { tag in
                        Text(tag)
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


struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
