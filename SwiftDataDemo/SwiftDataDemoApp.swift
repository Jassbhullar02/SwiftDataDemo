//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Jaspreet Bhullar
//

import SwiftUI
import SwiftData

// MARK: - SwiftDataDemoApp
// Entry point of the app. Responsible for initializing the main scene
// and setting up the SwiftData model container.

@main
struct SwiftDataDemoApp: App {
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            // The root view of the app
            ContentView()
        }
        // Initialize the SwiftData model container for the Book model
        .modelContainer(for: Book.self)
    }
}
