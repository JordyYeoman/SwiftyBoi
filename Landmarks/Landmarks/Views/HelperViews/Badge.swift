//
//  Badge.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 27/11/2024.
//

import SwiftUI

struct Badge: View {
    var symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .font(.system(size: 100))
    }
}

#Preview {
    Badge(symbolName: "figure.american.football.circle")
}
