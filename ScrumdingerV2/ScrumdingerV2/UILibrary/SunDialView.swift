import SwiftUI

struct SunDial: View {
    // Rotation binding
    @Binding var rotation: Double
    
    // Customizable properties
    var numberOfLines: Int = 36  // Number of radiating lines
    var circleSize: CGFloat = 100  // Size of the center circle
    var lineLength: CGFloat = 30   // Length of radiating lines
    var lineWidth: CGFloat = 2     // Width of radiating lines
    var color: Color = .orange     // Color of the entire dial
    
    // Gesture state
    @GestureState private var gestureRotation: Double = 0
    
    var body: some View {
        ZStack {
            // Center circle
            Circle()
                .fill(color)
                .frame(width: circleSize, height: circleSize)
            
            // Radiating lines
            CircleLines(numberOfLines: numberOfLines, circleSize: circleSize, lineLength: lineLength, lineWidth: lineWidth, color: color)
        }
        .frame(width: circleSize + lineLength*2, height: circleSize + lineLength*2)
        .rotationEffect(.degrees(rotation + gestureRotation))
        .gesture(
            RotationGesture()
                .updating($gestureRotation) { value, state, _ in
                    state = value.degrees
                }
                .onEnded { value in
                    rotation = (rotation + value.degrees).truncatingRemainder(dividingBy: 360)
                }
        )
    }
}

struct CircleLines: View {
    var numberOfLines: Int  // Number of radiating lines
    var circleSize: CGFloat  // Size of the center circle
    var lineLength: CGFloat   // Length of radiating lines
    var lineWidth: CGFloat     // Width of radiating lines
    var color: Color     // Color of the entire dial
    
    var body: some View {
        // Radiating lines
        ForEach(0..<numberOfLines, id: \.self) { index in
            // Every second line should be shorter
            let intermediateLineLength = index%2 == 0 ? lineLength/2 : lineLength
            
            Rectangle()
                .fill(color)
                .frame(width: lineWidth, height: intermediateLineLength)
                .offset(y: -(circleSize/2 + intermediateLineLength/2))
                .rotationEffect(.degrees(Double(index) * (360.0/Double(numberOfLines))))
        }
    }
}
