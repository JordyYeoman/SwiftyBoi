import SwiftUI

struct DashboardView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        HStack(spacing: 12) {
            CardView(title: "Calories Burnt", metric: "1.4k", unit: .energy)
            CardView(
                title: "Distance Covered", metric: "3.8", unit: .distance)
        }
        .padding(.vertical, 12)
        HStack(spacing: 12) {
            CardView(title: "Time in Bed", metric: "7.8", unit: .time)
            CardView(
                title: "Daily movement goal", metric: "72",
                unit: .percentage)
        }
    }
}

#Preview {
    DashboardView()
}
