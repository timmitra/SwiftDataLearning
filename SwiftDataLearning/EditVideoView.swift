//
//  EditVideoView.swift
//  SwiftDataLearning
//
//  Created by Tim Mitra on 2023-12-05.
//

import SwiftUI

struct EditVideoView: View {
  
  @Bindable var video: Video // bidirectional data flow
  @State private var newKeywordName = ""
  
    var body: some View {
      Form {
        TextField("Title:", text: $video.title)
        DatePicker("Date", selection: $video.date)
        
        Section("Keywords") {
          ForEach(video.keywords) { keyword in
            Text(keyword.title)
          }
          
          HStack {
            TextField("Add a new keyword for \(video.title)", text: $newKeywordName)
            Button("Add", action: addKeyword)
          }
        }
      }
      .navigationTitle("Edit Video")
      .navigationBarTitleDisplayMode(.inline)
    }
  
  func addKeyword() {
    guard newKeywordName.isEmpty == false else { return }
     
    withAnimation {
      let keyword = Keyword(title: newKeywordName)
      video.keywords.append(keyword)
      newKeywordName = ""
    }
  }
}

//#Preview {
//    EditVideoView()
//}
