//
//  HealthManager.swift
//  Win
//
//  Created by Jordy Yeoman on 27/8/2023.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        // TODO: Fix unsafe unwrap??
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}

class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var activities: [String: Activity] = [:]
    @Published var currentHR: Double = 0.0
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let heartRate = HKQuantityType(.heartRate)
        let calories = HKQuantityType(.activeEnergyBurned)
        
        let healthTypes: Set = [steps, heartRate, calories]
        
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("Sorry bra, unable to access the health data.")
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching todays step data")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            let goal = 10000.0
            
            let activity = Activity(id: 0, title: "Todays Steps", subTitle: "Goal - \(goal)", image: "figure.walk", amount: stepCount.formattedString(), percentComplete: "\(String(format: "%.2f", (stepCount/goal) * 100))")
            
            DispatchQueue.main.async {
                self.activities["todaySteps"] = activity
            }
            
            print("StepCount: \(stepCount.formattedString())")
        }
        
        healthStore.execute(query)
    }
    
    func fetchTodaysCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("Error fetching todays calorie data")
                return
            }
            
            let caloriesBurned = quantity.doubleValue(for: .kilocalorie())
            let goal = 2500.0 // Who knows what this value should be :D
            
            let activity = Activity(id: 0, title: "Todays Calories", subTitle: "Goal - \(goal)", image: "flame", amount: caloriesBurned.formattedString(), percentComplete: "\(String(format: "%.2f", (caloriesBurned/goal) * 100))")
            
            DispatchQueue.main.async {
                self.activities["todayCalories"] = activity
            }
            
            print("CaloriesBurned: \(caloriesBurned.formattedString())")
        }
        
        healthStore.execute(query)
    }
    
    func startHeartRateQuery() {
        print("Starting HR Query")
        
        // Create a sample type to use as the query param
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
            return
        }
        // Filter param - the last month
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        // Predicate ?? eh?
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date())
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) { (sample, result, error) in
            guard error == nil else {
                return
            }
            // Unsafe force unwrap??
            let data = result![0] as! HKQuantitySample
            let unit = HKUnit(from: "count/min")
            let latestHR = data.quantity.doubleValue(for: unit)
            print("Latest Heart Rate: \(latestHR) BPM")
            
            // Update the published var
            DispatchQueue.main.async {
                self.currentHR = latestHR
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/mm/yyyy hh:mm s"
            let startDate = dateFormatter.string(from: data.startDate)
            let endDate = dateFormatter.string(from: data.endDate)
            print("Start Date \(startDate) : End Date \(endDate)")
        }
        
        healthStore.execute(query)
    }
}
