//
//  HomeView.swift
//  Win
//
//  Created by Jordy Yeoman on 27/8/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10,000", image: "figure.walk", amount: "6,543", percentComplete: "\(String(format: "%.2f", (2043.0/10000.0) * 100))"))
                
                ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10,000", image: "figure.walk", amount: "6,543", percentComplete: "\(String(format: "%.2f", (6543.0/10000.0) * 100))"))
            }
            .padding(.horizontal)
        }
        .onAppear {
//            manager.fetchTodaySteps()
//            manager.fetchHR()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}