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
  
  let container: ModelContainer
  
  init() {
    do {
      container = try ModelContainer(for: Video.self, Keyword.self, migrationPlan: nil)
    } catch {
      fatalError("Failed to initialize the model container")
    }
  }
  
    var body: some Scene {
        WindowGroup {
            VideosView()
        }
        .modelContainer(container)
    }
}
