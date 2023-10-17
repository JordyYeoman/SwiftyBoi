//
//  Task.swift
//  Task Management
//
//  Created by Jordy Yeoman on 17/10/2023.
//

import SwiftUI

struct Task: Identifiable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init (taskTitle: "Exercise", creationDate: .updateHour(-5), isCompleted: true, tint: .cyan),
    .init (taskTitle: "Review 5 MR's", creationDate: .updateHour(2), isCompleted: true, tint: .green),
    .init (taskTitle: "Walk Dog", creationDate: .updateHour(-9), isCompleted: true, tint: .green),
    .init (taskTitle: "Complete Task", creationDate: .updateHour(-28), isCompleted: true, tint: .gray),
    .init (taskTitle: "Make Dinner", creationDate: .updateHour(4), isCompleted: true, tint: .indigo),
    .init (taskTitle: "Send it", creationDate: .updateHour(9), isCompleted: true, tint: .primary),
    .init (taskTitle: "Rebuild car", creationDate: .updateHour(-1), isCompleted: true, tint: .teal),
]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
