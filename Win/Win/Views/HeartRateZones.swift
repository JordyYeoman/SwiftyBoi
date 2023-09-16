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
    @State private var showDetail = false
    var currentXPos = 0.0
    var currentYPos = 0.0
    var age = 28
    var zoneHeight = 60.0
    var leftColTextWidth = 60.0
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
    var zoneContainerHeight: Double {
        return Double(heartRateZones.count) * zoneHeight
    }
    
    
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
                        Zone(lower: zone.lowerLimit, upper: zone.upperLimit, color: zone.color, zoneHeight: zoneHeight, leftColTextWidth: leftColTextWidth)
                    }
                }
                
                Circle()
                    .fill(.white)
                    .frame(width: 16, height: 16)
                    .position(x: currentXPos + leftColTextWidth + 16, y: zoneContainerHeight - 8 - currentYPos)
                    .shadow(radius: 2.0)
            }
            .frame(height: zoneContainerHeight)
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showDetail.toggle()
                }
            } label: {
                Label("Graph", systemImage: "chevron.right.circle")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                    .scaleEffect(showDetail ? 1.5 : 1)
                    .padding()
            }
        }
    }
}

struct Zone: View {
    var lower: Int
    var upper: Int
    var color: Color
    var zoneHeight: Double
    var leftColTextWidth: Double
    
    var body: some View {
        HStack {
            Text("\(lower) / \(upper)")
                .font(.caption)
                .bold()
                .frame(width: leftColTextWidth)
            
            Rectangle()
                .frame(height: zoneHeight) // Specify the height only
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
