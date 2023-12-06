//
//  SwiftDataLearningApp.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-05.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataLearningApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Video.self)
    }
}
