//
//  SplashScreenView.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/05.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        }
        else{
            VStack(){
                Image("LaunchPage").resizable().scaledToFit().aspectRatio(contentMode: .fill)
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}
    struct SplashScreen_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
