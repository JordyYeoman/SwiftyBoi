import Charts
import SwiftUI

struct HomeSectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
    }
}

func formatte(number: Int) -> String {
    let result = NSNumber(value: number)
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter.string(from: result) ?? ""
}

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    let heartRates: [HeartRate] = HeartRate.exampleData

    let linearGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color.accentColor.opacity(0.4), Color.accentColor.opacity(0),
        ]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    WelcomeBubbleView()
                    MetricsView()
                        .background(Color(UIColor.secondarySystemBackground))

                    HomeSectionHeader(title: "Recent Workouts")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.workouts, id: \.id) { workout in
                                NavigationLink(
                                    destination: WorkoutView(workout: workout)
                                ) {
                                    workoutCard(workout: workout)
                                }
                            }
                        }
                    }

                    DashboardView()
                    WorkoutCTAButtonView()
                        .padding(.top, 8)
                }
                .padding(.horizontal, 8)
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
    }

    @ViewBuilder func workoutCard(workout: Workout) -> some View {
        VStack {
            Text(workout.name)
                .font(.title2)
            Text(
                "Time: \(String(format: "%.1f", workout.timeInHours)) hours"
            )
            HStack {
                let iconName =
                    workout.category == .cardio
                    ? "figure.run" : "dumbbell.fill"
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .frame(width: 24, height: 24)
            }
        }
        .foregroundStyle(.white)
        .padding(12)
        .background(Color.retroDarkPurple.opacity(1))
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    HomeView()
}
