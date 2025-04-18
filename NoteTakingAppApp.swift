//
//  NoteTakingAppApp.swift
//  NoteTakingApp
//
//  Created by Lauren Ducay on 4/18/25.
//

import SwiftUI

@main
struct NoteTakingAppApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
