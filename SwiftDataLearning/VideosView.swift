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
  @State private var deletedVideo: Video?

    var body: some View {
      NavigationStack {
        VideoListView(selectedVideo: $selectedVideo, deletedVideo: $deletedVideo)
          .toolbar{
            Button("Add Video", systemImage: "plus", action: addVideo)
          }
          .onChange(of: deletedVideo) {_, newValue in
            guard let video = newValue else { return }
            delete(video)
          }
        }
    }
  func addVideo() {
    let video = Video()
    selectedVideo = video
    modelContext.insert(video)
  }
  
  func delete(_ video: Video) {
    modelContext.delete(video)
  }
}

#Preview {
  let preview = Preview(Video.self)
  preview.addExamples(Video.sampleVideos)
  return NavigationStack {
    VideosView()
      .modelContainer(preview.container)
  }
}
