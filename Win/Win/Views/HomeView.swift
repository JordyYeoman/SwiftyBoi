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
            HeartRateZones()
                .padding(.horizontal)
            
            SmallActivityCard(activity: SmallActivity(title: "Heart Rate", currentValue: "120", image: "heart.fill"))
                .frame(height: 80)
                .padding(.all)
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10,000", image: "figure.walk", amount: "6,543", percentComplete: "\(String(format: "%.2f", (2043.0/10000.0) * 100))"))
                
                ActivityCard(activity: Activity(id: 0, title: "Daily Steps", subTitle: "Goal: 10,000", image: "figure.walk", amount: "6,543", percentComplete: "\(String(format: "%.2f", (6543.0/10000.0) * 100))"))
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .onAppear {
            manager.fetchTodaySteps()
            manager.startHeartRateQuery()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HealthManager())
    }
}
