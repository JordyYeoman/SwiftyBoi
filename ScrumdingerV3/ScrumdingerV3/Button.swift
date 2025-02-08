import SwiftUI

struct ButtonWrapper: View {
    struct BlueButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.5))
                .foregroundStyle(configuration.isPressed ? .navy : .white)
                .clipShape(Capsule())
        }
    }
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BlueButton())
        
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(GrowingButton())
    }
}

#Preview {
    ButtonWrapper()
}
