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

struct ZoneData: Hashable, Identifiable {
    var id = UUID()
    var maxHR: Int
    var lowerPercent: Int
    var upperPercent: Int
    var lowerLimit: Int {
        return maxHR * lowerPercent / 100
    }
    var upperLimit: Int {
        return maxHR * upperPercent / 100
    }
}

struct HeartRateZones: View {
    var age = 28
    var maxHR: Int {
        return 220 - age
    }
    
    var heartRateZones = [
        ZoneData(maxHR: 198, lowerPercent: 50, upperPercent: 60),
        ZoneData(maxHR: 198, lowerPercent: 60, upperPercent: 70),
        ZoneData(maxHR: 198, lowerPercent: 70, upperPercent: 80),
        ZoneData(maxHR: 198, lowerPercent: 80, upperPercent: 90),
        ZoneData(maxHR: 198, lowerPercent: 90, upperPercent: 100),
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
                Zone(lower: zone.lowerLimit, upper: zone.upperLimit)
            }
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
