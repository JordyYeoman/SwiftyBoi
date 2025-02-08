import SwiftUI

struct MeetingView: View {
    @State private var dialRotation: Double = 0
    @GestureState private var gestureRotation: Double = 0
    
    var circleSize: CGFloat = 100  // Size of the center circle
    
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            HStack {
                Circle()
                    .frame(width: 50, height: 50, alignment: .leading)
                Spacer()
                Circle()
                    .frame(width: 50, height: 50, alignment: .leading)
            }
            // Optional: Add buttons to demonstrate programmatic rotation
            HStack {
                Button("Rotate Left") {
                    withAnimation {
                        dialRotation = (dialRotation - 45).truncatingRemainder(dividingBy: 360)
                    }
                }
                
                Button("Rotate Right") {
                    withAnimation {
                        dialRotation = (dialRotation + 45).truncatingRemainder(dividingBy: 360)
                    }
                }
            }
            .padding()
            
            SunDial(rotation: $dialRotation)
            
            // Display current rotation angle
            Text("Rotation: \(Int(dialRotation))°")
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .fill(.yellow)
                        .strokeBorder(lineWidth: 24)
                    CircleLines(numberOfLines: 50, circleSize: proxy.size.width - 20, lineLength: 15, lineWidth: 2, color: .yellow)
                }
                .frame(width: proxy.size.width - 20, height: proxy.size.height - 20)
                .rotationEffect(.degrees(dialRotation + gestureRotation))
                .gesture(
                    RotationGesture()
                        .updating($gestureRotation) { value, state, _ in
                            state = value.degrees
                        }
                        .onEnded { value in
                            dialRotation = (dialRotation + value.degrees).truncatingRemainder(dividingBy: 360)
                        }
                )
                .padding(.leading, 10)
            }
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
