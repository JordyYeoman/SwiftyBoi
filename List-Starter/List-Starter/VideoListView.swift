//
//  VideoListView.swift
//  List-Starter
//
//  Created by Jordy Yeoman on 29/7/2023.
//

import SwiftUI

struct VideoListView: View {
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
            }
            .listStyle(.grouped)
            .navigationTitle("Videos")
        }
    }
}

struct VideoCell: View {
    var video: Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
