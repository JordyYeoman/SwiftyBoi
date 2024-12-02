//
//  DetailView.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 26/11/2024.
//

import SwiftUI

struct LandmarkDetailView: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "dog")
                    .imageScale(.large)
                    .foregroundStyle(.mint)
                Text("LandMarks")
                    .foregroundStyle(.mint)
                
                Spacer()
                
                UserProfileImage()
            }
            .padding(.horizontal)
            
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 250)
            
            MapViewSnapshotImage(image: landmark.image)
                .offset(x: 0, y: -60)
                .padding(.bottom, -60)
            
            LocationPreviewDescription(landmark: landmark)
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetailView(landmark: ModelData().landmarks[1])
}
