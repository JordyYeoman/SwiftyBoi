import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to your data")
            GraphView()
            MetricsDashboard()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
