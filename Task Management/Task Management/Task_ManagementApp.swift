//
//  Task_ManagementApp.swift
//  Task Management
//
//  Created by Jordy Yeoman on 17/10/2023.
//

import SwiftUI

@main
struct Task_ManagementApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
