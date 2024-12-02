//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 27/11/2024.
//

import SwiftUI

enum BadgeName {
    case SpeedWalker
    case EnduranceMaster
    case ElevationKing
}

let badgeLookup: [BadgeName:String] = [
    BadgeName.SpeedWalker: "figure.walk.motion",
    BadgeName.EnduranceMaster: "figure.hiking",
    BadgeName.ElevationKing: "figure.climbing"
]

let colorLookup: [BadgeName:Color] = [
    BadgeName.SpeedWalker: .red,
    BadgeName.EnduranceMaster: .blue,
    BadgeName.ElevationKing: .green
]

struct HikeBadge: View {
    var badgeName: BadgeName
    var label: String
    private var name: String {
        badgeLookup[badgeName] ?? "figure"
    }
    private var color: Color {
        colorLookup[badgeName] ?? .pink
    }

    var body: some View {
        VStack(alignment: .center) {
            Badge(symbolName: name)
                .foregroundStyle(color)
                .scaleEffect(0.8)
                .frame(width: 100, height: 100)
            Text(label)
                .font(.caption)
                .accessibilityLabel("Badge for \(label).")
                .foregroundStyle(color)
        }
    }
}


#Preview {
    HikeBadge(badgeName: BadgeName.ElevationKing, label: "Elevation King")
}
