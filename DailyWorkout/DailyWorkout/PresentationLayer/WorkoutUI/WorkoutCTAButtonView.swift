import SwiftUI

struct WorkoutCTAButtonView: View {
    var body: some View {
        HStack(spacing: 0) {
            WorkoutCTAButton(title: "Create Workout") {
                print("Sup")
            }
            Spacer()
            WorkoutCTAButton(title: "Start Workout") {
                print("Brah")
            }
        }
    }
}

private struct WorkoutCTAButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
        )
    }
}

#Preview {
    WorkoutCTAButtonView()
}
