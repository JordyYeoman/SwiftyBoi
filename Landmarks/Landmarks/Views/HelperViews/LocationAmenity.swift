//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 25/11/2024.
//

import SwiftUI

struct LocationAmenity: View, Hashable {
    var amenity: String
    var iconName: String
    var shortDescription: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .imageScale(.large)
                .foregroundStyle(.mint)
            Text(amenity)
                .font(.subheadline)
            Spacer()
            Text(shortDescription)
                .font(.subheadline)
                .padding(.horizontal)
        }
    }
}

#Preview {
    LocationAmenity(amenity: "Toilets", iconName: "toilet", shortDescription: "Available")
}
