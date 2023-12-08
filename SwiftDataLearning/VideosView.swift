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
  @State private var sortDescriptor = SortDescriptor(\Video.title)

    var body: some View {
      NavigationStack {
        VideoListView(sortDescriptor: sortDescriptor, selectedVideo: $selectedVideo, deletedVideo: $deletedVideo)
          .toolbar{
            Button("Add Video", systemImage: "plus", action: addVideo)
            
            Menu("Menu", systemImage: "arrow.up.arrow.down") {
              Picker("Menu", selection: $sortDescriptor) {
                Text("Title").tag(SortDescriptor(\Video.title))
                Text("Date").tag(SortDescriptor(\Video.date, order: .reverse))
              }
            }
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
  let videos = preview.addExamples(Video.sampleVideos)
  let keywords = preview.addExamples(Keyword.sampleKeywords)
  //videos[0].keywords?.append([keyword[0]
  //videos[0]
  return NavigationStack {
    VideosView()
      .modelContainer(preview.container)
  }
}
