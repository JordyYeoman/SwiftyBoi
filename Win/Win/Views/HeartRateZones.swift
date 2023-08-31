//
//  HeartRateZones.swift
//  Win
//
//  Created by Jordy Yeoman on 31/8/2023.
//


// Building using these HR zones from .edu.au - Might need tweaking
//Zone 1: Very light, 50-60% of MHR
//Zone 2: Light, 60-70% of MHR
//Zone 3: Moderate, 70-80% of MHR
//Zone 4: Hard, 80-90% of MHR
//Zone 5: Maximum, 90%> of MHR

import SwiftUI

struct Zone: Identifiable {
    var id = UUID()
    var maxHR: Int
    var limit: Int {
        return maxHR * percentage / 100
    }
}

struct HeartRateZones: View {
    var age = 28
    var maxHR: Int {
        return 220 - age
    }
    
    var heartRateZones = [
        Zone(
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("HR Zones:")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            
            ForEach(heartRateZones, id: \.self) { zone in
                           Text("Zone \(zone)")
                       }
            Zone(lower: 0, upper: 50)
            Zone(lower: 50, upper: 80)
            Zone(lower: 80, upper: 105)
            Zone(lower: 80, upper: 105)
            Zone(lower: 80, upper: 105)
        }
        .padding(.horizontal, 15)
    }
}

struct Zone: View {
    var lower: Int
    var upper: Int
    
    var body: some View {
        HStack {
            Text("\(lower) / \(upper)")
                .font(.caption)
                .bold()
                .frame(width: 50)
            
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 32)
                    .foregroundColor(Color.blue)
                    .cornerRadius(10)
                Circle()
                    .fill(.red)
                    .frame(width: 16, height: 16)
            }
        }
    }
}

struct HeartRateZones_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateZones()
    }
}
