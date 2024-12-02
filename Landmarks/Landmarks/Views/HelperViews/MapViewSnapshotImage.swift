//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 25/11/2024.
//

import SwiftUI

struct MapViewSnapshotImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100, alignment: .top)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 4)
    }
}

#Preview {
    MapViewSnapshotImage(image: Image(.broomeProfile))
}
