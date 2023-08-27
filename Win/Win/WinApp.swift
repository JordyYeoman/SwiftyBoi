//
//  WinApp.swift
//  Win
//
//  Created by Jordy Yeoman on 26/8/2023.
//

import SwiftUI

@main
struct WinApp: App {
    @StateObject var manager = HealthManager()
    
    var body: some Scene {
        WindowGroup {
            ActivityTabView()
                .environmentObject(manager)
        }
    }
}
