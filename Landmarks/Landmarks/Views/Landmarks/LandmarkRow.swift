//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 26/11/2024.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
                .onTapGesture {
                    print("Tapped")
                }
            
            Spacer()
            
            if landmark.isFavourite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Landmark Group") {
    let landmarks = ModelData().landmarks
        return Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
}
