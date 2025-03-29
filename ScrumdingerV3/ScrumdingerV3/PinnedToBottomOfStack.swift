import SwiftUI

struct PinnedToBottomOfStack: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0.0) {
                Text("Hello")
                Text("Hello1")
                Text("Hello2")
                Text("Hello3")
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Text("Hello world")
        }
    }
}

#Preview {
    PinnedToBottomOfStack()
        .frame(width: .infinity, height: .infinity)
        .background(.red)
}
