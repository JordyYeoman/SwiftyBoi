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
    
    @Published var activaties: [String: Activity] = [:]
    
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
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        // variable initialization
        var lastHeartRate = 0.0
        let heartRateQuantity = HKUnit(from: "count/min")
//        @State private var value = 0
        
        // cycle and value assignment
        for sample in samples {
            print("Sample: \(sample)")
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
            
//            self.value = Int(lastHeartRate)
            print("Last val: \(Int(lastHeartRate))")
        }
    }
    
    func startHeartRateQuery() {
        
        // We want data points from our current device
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        
        // A query that returns changes to the HealthKit store, including a snapshot of new changes and continuous monitoring as a long-running query.
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            // A sample that represents a quantity, including the value and the units.
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            
            print("Looping over HR shiz, sampples: \(samples)")
            self.process(samples, type: HKQuantityTypeIdentifier.heartRate)
            
        }
        
        // It provides us with both the ability to receive a snapshot of data, and then on subsequent calls, a snapshot of what has changed.
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        // query execution
        
        healthStore.execute(query)
    }
}
