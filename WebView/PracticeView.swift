//
//  PracticeView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/05.
//

import SwiftUI

struct PracticeView: View {
    @State private var showModal = false
    var body: some View {
//        NavigationView {
//                    HStack{
//                        NavigationLink(destination: MyWebView(urlToLoad: "https://seons-dev.tistory.com/")) {
//                            Text("서근 블로그")
//                                .edgesIgnoringSafeArea(.all)
//                                .padding()
//                                .background(Color.green)
//                                .foregroundColor(.black)
//                                .cornerRadius(20, antialiased: true)
//                        }
//                        NavigationLink(destination: MyWebView(urlToLoad: "https://www.google.com")) {
//                            Text("구글")
//                                .edgesIgnoringSafeArea(.all)
//                                .padding()
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(20, antialiased: true)
//                        }
//                        NavigationLink(destination: MyWebView(urlToLoad: "https://www.youtube.com")) {
//                            Text("유튜브")
//                                .edgesIgnoringSafeArea(.all)
//                                .padding()
//                                .background(Color.red)
//                                .foregroundColor(.white)
//                                .cornerRadius(20, antialiased: true)
//                        }
//                    }
//                }
        
        VStack{
                    Text("'나타나라'버튼 누르면 모달 출력!")
                    Button(action: {
                        self.showModal = true
                    }){
                        Text("나타나라").bold()
                    }
                    .frame(width: 80, height: 30, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.accentColor))
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
                    .sheet(isPresented: self.$showModal) {
                        MyWebView(urlToLoad: "https://www.musinsa.com/app/goods/2430924/0")
                    } //Button 끝
                } //Vstack 끝
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Modal view 등장")
            Button(action: {
                presentation.wrappedValue.dismiss()
            }) {
                Text("Modal view 닫기").bold()
            }
            .frame(width: 150, height: 30, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 40).fill(Color.blue))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
        }
    }
}
