//
//  personalTrainerApp.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import SwiftUI

@main
struct personalTrainerApp: App {
    var body: some Scene {
        WindowGroup {
            if loadScheda {
                ProfileView()
            } else {
                ContentView()
            }
        }
    }
}
