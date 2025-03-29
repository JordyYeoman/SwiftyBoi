import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text("Hello")
                Text("Hello23")
            }
            Text("WOrld123")
        }
    }
}

#Preview {
    TestView()
}
