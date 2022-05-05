//
//  BuckilPage.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/04.
//

import SwiftUI

struct BuckilPage: View {
    var item: Daily
    @Binding var currentFont: String
    @Environment(\.presentationMode) var presentationMode
    var clothesurl: String  = ""
    var clothesarray:[String] = ["outer", "semiouter", "top", "pants", "shoes", "cap", "glasses", "belt", "socks", "accessories"]
    var body: some View {
        ScrollView{
            VStack{
                ZStack {
                    BuckilPageNavigationBarView(currentFont: self.$currentFont, Item: item)
                    
                    
                    
                    HStack {
                        Button {
                            goBack()
                        } label: {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color("MainColor"))
                                Text ("Back")
                                    .foregroundColor(Color("MainColor"))
                                    .font(.custom(currentFont, size: 18))
                            }
                        }
                        .frame(height: 75.0)
                        .padding(.top, -72.0)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width-30, height: 70)
                    
                    
                    Spacer()
                }
                Divider()
                Image(item.imageURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                    .aspectRatio(1, contentMode: .fit)
                
                Spacer()
                Divider()
                Section{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Recommended Items")
                            .bold()
                            .font(.custom(currentFont, size: 17))
                            .foregroundColor(Color("MainColor"))
                            .frame( height: 17, alignment: .center)
                            
                        Spacer()
                    }
                    ScrollView(.horizontal){
                        VStack{
                            HStack{
                                Text(clothesarray[item.bestClothes[0]])
                                    .font(.custom(currentFont, size: 17))
                                    .foregroundColor(Color("MainColor"))
                                    .frame(width: 170, height: 30, alignment: .center)
                                    .padding(.horizontal)
                                Text(clothesarray[item.bestClothes[1]])
                                    .font(.custom(currentFont, size: 17))
                                    .foregroundColor(Color("MainColor"))
                                    .frame(width: 170, height: 30, alignment: .center)
                                    .padding(.horizontal)
                            }
                            HStack(alignment: .center){
                                Image(item.clothes[item.bestClothes[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:170 , height: 170, alignment: .leading)
                                    .aspectRatio(1, contentMode: .fill)
                                    .padding(.horizontal)
                                Image(item.clothes[item.bestClothes[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 170, height: 170, alignment: .leading)
                                    .aspectRatio(1, contentMode: .fill)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                Divider()
                Section{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("All Items")
                            .bold()
                            .font(.custom(currentFont, size: 17))
                            .foregroundColor(Color("MainColor"))
                            .frame(height: 17, alignment: .center)
                            
                        Spacer()
                    }
                    ScrollView(.horizontal){
                        VStack{
                            HStack{
                                ForEach(clothesarray, id:\.self){
                                    i in
                                    Text(i)
                                        .font(.custom(currentFont, size: 17))
                                        .foregroundColor(Color("MainColor"))
                                        .frame(width: 130, height: 30, alignment: .center)
                                        .padding(.horizontal)
                                }
                            }
                            HStack{
                                ForEach(item.clothes, id: \.self){
                                    clothesurl in
                                    Image(clothesurl)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:130 , height: 130, alignment: .leading)
                                        .aspectRatio(1, contentMode: .fill)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
    func goBack() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
//
//struct BuckilPage_Previews: PreviewProvider {
//    static var previews: some View {
//        BuckilPage(item: ")
//    }
//}
