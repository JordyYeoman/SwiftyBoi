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
    var color: Color
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
        ZoneData(maxHR: 198, lowerPercent: 90, upperPercent: 100, color: Color.red),
        ZoneData(maxHR: 198, lowerPercent: 80, upperPercent: 90, color: Color.orange),
        ZoneData(maxHR: 198, lowerPercent: 70, upperPercent: 80, color: Color.yellow),
        ZoneData(maxHR: 198, lowerPercent: 60, upperPercent: 70, color: Color.blue),
        ZoneData(maxHR: 198, lowerPercent: 50, upperPercent: 60, color: Color.green),
    ]
    
    
    var body: some View {
        VStack {
            HStack {
                Text("HR Zones:")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            
            ZStack {
                Color.purple
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ForEach(heartRateZones, id: \.self) { zone in
                        Zone(lower: zone.lowerLimit, upper: zone.upperLimit, color: zone.color)
                    }
                }
                
                Circle()
                    .fill(.white)
                    .frame(width: 16, height: 16)
                    .position(x: 250, y: 45)
                    .shadow(radius: 2.0)
            }
            .frame(height: 160)
        }
    }
}

struct Zone: View {
    var lower: Int
    var upper: Int
    var color: Color
    
    var body: some View {
        HStack {
            Text("\(lower) / \(upper)")
                .font(.caption)
                .bold()
                .frame(width: 60)
            
            Rectangle()
                .frame(height: 32) // Specify the height only
                .foregroundColor(color)
                .edgesIgnoringSafeArea(.horizontal)
        }
    }
}

struct HeartRateZones_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateZones()
    }
}
