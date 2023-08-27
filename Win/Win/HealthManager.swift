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
            print("StepCount: \(stepCount)")
        }
        
        healthStore.execute(query)
    }
    
    // TODO
//    func fetchHR() {
//        let heartData = HKQuantityType(.heartRate)
//        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
//        let query = HKStatisticsQuery(quantityType: heartData) { _, result, error in
//
//            print("Result of HR: \(result)")
//        }
//
//        healthStore.execute(query)
//    }
}
