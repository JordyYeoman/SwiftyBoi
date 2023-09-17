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
    @State private var currentXPos = 0.0
    @State private var currentYPos = 0.0
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
                
                PulseCircle(showDetail: $showDetail, xPos: $currentXPos, yPos: $currentYPos)
                    .position(x: currentXPos + leftColTextWidth + 16, y: zoneContainerHeight - 8 - currentYPos)
            }
            .frame(height: zoneContainerHeight)
            
            Spacer()
            
            Button {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showDetail.toggle()
                    currentXPos += 15.0
                    currentYPos += 15.0
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

struct PulseCircle: View {
    @State var animate = false
    @Binding var showDetail: Bool
    @Binding var xPos: Double
    @Binding var yPos: Double
    var size = 30.0

    var colourToShow: Color {
        return showDetail ? .white : .black
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle().fill(colourToShow.opacity(0.25)).frame(width: size, height: size).scaleEffect(self.animate ? 1 : 0)
                Circle().fill(colourToShow.opacity(0.35)).frame(width: size - 10, height: size - 10).scaleEffect(self.animate ? 1 : 0)
                Circle().fill(colourToShow.opacity(0.45)).frame(width: size - 25, height: size - 25).scaleEffect(self.animate ? 1 : 0)
                Circle().fill(colourToShow).frame(width: size - 20.75, height: size - 20.75)
            }
            .onAppear { self.animate = true }
            .animation(animate ? Animation.easeInOut(duration: 1).repeatForever(autoreverses: true) : .default, value: animate)
            .onChange(of: showDetail) { _ in
                self.animate = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.animate = true
                }
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
