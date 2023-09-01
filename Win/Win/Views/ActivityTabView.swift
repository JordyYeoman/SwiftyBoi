//
//  ActivityView.swift
//  Win
//
//  Created by Jordy Yeoman on 27/8/2023.
//

import SwiftUI

struct ActivityTabView: View {
    @EnvironmentObject var manager: HealthManager
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                }
                .environmentObject(manager)
            
            ContentView()
                .tag("Content")
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct ActivityTabView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTabView()
            .environmentObject(HealthManager())
    }
}
