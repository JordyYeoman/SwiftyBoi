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

class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var activities: [String: Activity] = [:]
    @Published var currentHR: Double = 0.0
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let heartRate = HKQuantityType(.heartRate)
        
        let healthTypes: Set = [steps, heartRate]
        
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
            
            let activity = Activity(id: 0, title: "Todays Steps", subTitle: "Goal - \(goal)", image: "figure.walk", amount: "\(stepCount)", percentComplete: "\(String(format: "%.2f", (stepCount/goal) * 100))")
            print("StepCount: \(stepCount)")
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
//            self.currentHR = latestHR
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/mm/yyyy hh:mm s"
            let startDate = dateFormatter.string(from: data.startDate)
            let endDate = dateFormatter.string(from: data.endDate)
            print("Start Date \(startDate) : End Date \(endDate)")
        }
        
        healthStore.execute(query)
    }
}
