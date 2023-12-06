//
//  VideosView.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-05.
//

import SwiftUI
//import SwiftData

struct VideosView: View {
  
  @Environment(\.modelContext) private var modelContext
  @State private var selectedVideo: Video?
  
    var body: some View {
      NavigationStack {
        VideoListView(selectedVideo: $selectedVideo)
          .toolbar{
            Button("Add Video", systemImage: "plus", action: addVideo)
          }
        }
    }
  func addVideo() {
    let video = Video()
    selectedVideo = video
    modelContext.insert(video)
  }
}

#Preview {
    VideosView()
}
