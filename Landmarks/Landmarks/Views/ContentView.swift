//
//  ContentView.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
        case person
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            Text("Sup bra")
                .tabItem {
                    Label("Yo Yo", systemImage: "figure")
                }
                .tag(Tab.person)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
