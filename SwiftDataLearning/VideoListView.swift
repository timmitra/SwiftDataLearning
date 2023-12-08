//
//  ContentView.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-05.
//

import SwiftUI
import SwiftData

struct VideoListView: View {
  
  @Query var videos: [Video]
  @Binding var selectedVideo: Video?
  @Binding var deletedVideo: Video?
  
  init(sortDescriptor: SortDescriptor<Video>, searchText: String, selectedVideo: Binding<Video?>, deletedVideo: Binding<Video?>) {
    // underscore accesses the video Query
    _videos = Query(filter: #Predicate{
      if searchText.isEmpty {
        return true
      } else {
        return $0.title.localizedStandardContains(searchText) // case insensiotive
      }
    }, sort: [sortDescriptor])
    _selectedVideo = selectedVideo
    _deletedVideo = deletedVideo
  }
  
    var body: some View {
        List {
          ForEach(videos) { video in
            cell(video)
              .listRowInsets(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
          }
          .onDelete (perform: delete(_:))
        }
        .sheet(item: $selectedVideo) { video in
          NavigationStack {
            EditVideoView(video: video)
          }
        }
        .padding()
    }
  
  func delete (_ indexSet: IndexSet) {
    for index in indexSet {
      let video = videos[index]
      deletedVideo = video
    }
  }
  
  func cell(_ video: Video) -> some View {
    VStack {
      VStack(alignment: .leading) {
        Text(video.title).bold()
        Text(video.date.formatted(date: .abbreviated, time: .shortened))
          .font(.caption2)
          .foregroundStyle(.secondary)
      }
      .padding(.horizontal)
      .frame(maxWidth: .infinity, alignment: .leading)
      
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: 0) {
          ForEach(video.keywords) { keyword in
            Text(keyword.title)
              .font(.caption2)
              .foregroundStyle(.background)
              .bold()
              .padding(8)
              .background {
                RoundedRectangle(cornerRadius: 4)
                  .foregroundStyle(.secondary)
              }
              .padding(.horizontal, 4)
          }
        }
      }
      .onTapGesture {
        selectedVideo = video
      }
    }
  }
}

//#Preview {
//  let preview = Preview(Video.self)
//  preview.addExamples(Video.sampleVideos)
//  return NavigationStack {
//    VideoListView(selectedVideo: Video.sampleVideos[0], deletedVideo: Video.sampleVideos[0])
//  }
//  .modelContainer(preview.container)
//}
