//
//  HomeView.swift
//  Win
//
//  Created by Jordy Yeoman on 27/8/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager: HealthManager
    @State private var counter = 0.0
    
    var body: some View {
        VStack {
            HeartRateZones()
                .padding(.horizontal)
            
            Text("Testing timer: \(counter)")
                .onAppear {
                    startTimer()
                    cronJobTimer()
                }
            
            SmallActivityCard(activity: SmallActivity(title: "Heart Rate", currentValue: "\(Int(manager.currentHR))", image: "heart.fill"))
                .frame(height: 80)
                .padding(.all)
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)) {
                ForEach(manager.activities.sorted(by: { $0.value.id < $1.value.id }), id: \.key) { item in
                    ActivityCard(activity: item.value)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .onAppear {
            manager.fetchTodaySteps()
            manager.fetchHR()
            manager.fetchTodaysCalories()
        }
    }
    
    
    // Function to start the timer
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            updateCounter()
            manager.fetchHR()
        }
    }
    
    private func cronJobTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            manager.fetchTodaySteps()
            manager.fetchTodaysCalories()
        }
    }
    
    // Function to update the counter
    private func updateCounter() {
        // Update the @State variable to trigger a view update
        counter += 0.5
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HealthManager())
    }
}
