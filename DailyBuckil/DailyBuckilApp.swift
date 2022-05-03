//
//  DailyBuckilApp.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/04/26.
//

import SwiftUI

@main
struct DailyBuckilApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ListView()
        }
    }
}
