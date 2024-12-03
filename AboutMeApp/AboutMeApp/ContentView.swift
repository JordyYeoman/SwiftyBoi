//
//  ContentView.swift
//  AboutMeApp
//
//  Created by Jordy Yeoman on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            FunFactsView()
                .tabItem {
                    Label("SendIt", systemImage: "helmet")
                }
            
            DatePlannerView()
                .tabItem {
                    Label("Yeah Nawwww", systemImage: "helmet")
                }
            
            Text("Fun Facts")
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}

#Preview {
    ContentView()
}
