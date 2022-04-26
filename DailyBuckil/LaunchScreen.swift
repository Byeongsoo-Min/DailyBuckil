//
//  LaunchScreen.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/26.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        Image("launch page")
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
