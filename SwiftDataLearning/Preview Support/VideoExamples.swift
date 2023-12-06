//
//  VideoExamples.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-06.
//

import Foundation

extension Video {
  static let nextWeek = Calendar.current.date(byAdding: .day, value: +7, to: Date.now)!
  static let lastWeek = Calendar.current.date(byAdding: .day, value: -7, to: Date.now)!
  static var sampleVideos: [Video] {
    [
      Video(title: "2001: A Space Odyssey"),
      Video(title: "Star Wars"),
      Video(title: "Barry Lyndon"),
      Video(title: "Terms of Endearment")
    ]
  }
}
