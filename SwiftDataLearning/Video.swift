//
//  Video.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-05.
//

import SwiftUI
import SwiftData

@Model
class Video {
  var title: String
  var date: Date
  
  init(title: String = "") {
    self.title = title
    self.date = .now
  }
}
