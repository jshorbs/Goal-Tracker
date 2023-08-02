//
//  GoalTrackerApp.swift
//  GoalTracker
//
//  Created by Jude Shorbaji on 8/2/23.
//

import SwiftUI

@main
struct GoalTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
