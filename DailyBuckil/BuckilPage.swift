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
    var body: some View {
        BuckilPageNavigationBarView(currentFont: self.$currentFont, Item: item)
        Image(item.imageURL)
            .resizable()
            .frame(width: 300, height: 300, alignment: .center)
            
        
        
            .navigationBarHidden(true)
    }
}
//
//struct BuckilPage_Previews: PreviewProvider {
//    static var previews: some View {
//        BuckilPage(item: ")
//    }
//}
