//
//  personalTrainerApp.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI

@main
struct personalTrainerApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
//            ProfileView().environment(\.managedObjectContext, dataController.container.viewContext)
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
