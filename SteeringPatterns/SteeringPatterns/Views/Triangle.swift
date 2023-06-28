//
//  Triangle.swift
//  SteeringPatterns
//
//  Created by Jordy Yeoman on 28/6/2023.
//

import SwiftUI

struct TriangleView: View {
    
    @State var xPos = 0.0
    @State var yPos = 0.0
    @State var velocity = 2;
    @State var scaleVal = 0.075
    
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                // Top portion of triangle
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                // Larger bottom part of triangle
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
        }
        .offset(x: xPos, y: yPos)
        .scaleEffect(scaleVal)
        .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true).speed(4))
        .onAppear() {
            scaleVal += 0.1
            xPos += 150
            yPos += 250
        }
    }
}

struct Triangle_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}
