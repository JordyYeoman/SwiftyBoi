import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    
    var body: some View {
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
            
            Tab("Totals", systemImage: "square.grid.3x3.topmiddle.filled", value: 3) {
                Text("Totals")
            }
        }
        //1
        .tint(.retroPink)
        .onAppear(perform: {
            //2
            UITabBar.appearance().unselectedItemTintColor = .white
            //3
            UITabBarItem.appearance().badgeColor = .retroPink
            //4
            UITabBar.appearance().backgroundColor = .retroDarkPurple
            //5
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Color.retroPink]
        })
    }
}

#Preview {
    ContentView()
}
