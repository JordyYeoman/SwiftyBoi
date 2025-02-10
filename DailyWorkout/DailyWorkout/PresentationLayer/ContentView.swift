import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0

    var body: some View {
        VStack(spacing: 0.0) {
            AppBarView()
            TabView(selection: $selection) {
                Tab("Dashboard", systemImage: "house", value: 0) {
                    HomeView()
                }
                
                Tab("Workouts", systemImage: "list.clipboard", value: 1) {
                    Text("Workouts")
                }
                
                Tab("Exercises", systemImage: "dumbbell.fill", value: 2) {
                    Text("Exercises")
                }
                
                Tab(
                    "Totals", systemImage: "square.grid.3x3.topmiddle.filled",
                    value: 3
                ) {
                    Text("Totals")
                }
            }
            .tint(.retroPink)
            .onAppear(perform: {
                UITabBar.appearance().barTintColor = .retroDarkPurple
                UITabBar.appearance().unselectedItemTintColor = .white
                UITabBarItem.appearance().badgeColor = .retroPink
                UITabBar.appearance().backgroundColor = .retroDarkPurple
            })
        }
    }
}

#Preview {
    ContentView()
}
