//
//  PreviewContainer.swift
//  MyBooks
//
//  Created by Tim Mitra on 2023-11-27.
//

import Foundation
import SwiftData

struct Preview {
  let container: ModelContainer
  // inject models - a variadic array of persistent model.Type
  init(_ models: any PersistentModel.Type...) {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    // need schema, which can take a variadic set of models
    let schema = Schema(models)
    do {
      container = try ModelContainer(for: schema, configurations: config)
    } catch {
      fatalError("Could not configure the container")
    }
  }
  func addExamples(_ examples: [any PersistentModel]) {
    Task { @MainActor in // Task to make async and "@MainActor in" to put it on the main thread
      examples.forEach { example in
        container.mainContext.insert(example)
      }
    }
  }
}
