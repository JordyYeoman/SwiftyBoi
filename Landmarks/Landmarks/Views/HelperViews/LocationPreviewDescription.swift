//
//  LocationPreviewDescription.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 25/11/2024.
//

import SwiftUI

struct CampsiteAmenityDescription {
    let id = UUID()
    var amenity: String
    var iconName: String
    var shortDescription: String
    var longDescription: String?
}

struct LocationPreviewDescription: View {
    @Environment(ModelData.self) var modelData
    
    let landmark: Landmark
    let amenities: [CampsiteAmenityDescription] = [
        CampsiteAmenityDescription(amenity: "Toilets", iconName: "toilet", shortDescription: "Available"),
        CampsiteAmenityDescription(amenity: "Pets", iconName: "dog", shortDescription: "Allowed"),
        CampsiteAmenityDescription(amenity: "Campgrounds", iconName: "tent", shortDescription: "Available"),
        CampsiteAmenityDescription(amenity: "Showers", iconName: "shower", shortDescription: "Available"),
        CampsiteAmenityDescription(amenity: "Drinking Water", iconName: "waterbottle", shortDescription: "Available"),
        CampsiteAmenityDescription(amenity: "Food", iconName: "toilet", shortDescription: "Available to buy")
    ]
    let colors: [Color] = [.red, .green, .blue]
    
    var landmarkIndex: Int {
           modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
       }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack(alignment: .leading) {
            HStack{
                VStack(alignment: .leading){
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavouriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavourite)
                    }
                    Text(landmark.park)
                        .font(.caption2)
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    HStack{
                        Image(systemName: "map")
                            .imageScale(.large)
                            .foregroundStyle(.mint)
                        Image(systemName: "mappin")
                            .imageScale(.large)
                            .foregroundStyle(.mint)
                    }.padding(.horizontal)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Amenities")
                    .font(.title3)
                    .foregroundStyle(.mint)
                
                ForEach(amenities, id: \.id) { amenity in
                    LocationAmenity(amenity: amenity.amenity, iconName: amenity.iconName, shortDescription: amenity.shortDescription)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let modelData = ModelData()
    return LocationPreviewDescription(landmark: modelData.landmarks[3])
        .environment(modelData)
}
