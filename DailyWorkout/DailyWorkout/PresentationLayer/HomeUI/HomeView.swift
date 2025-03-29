import Charts
import SwiftUI

struct HomeSectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.vertical, 8)
    }
}

struct PetData: Identifiable {
    var id: UUID

    var year: Int
    var population: Double

    init(year: Int, population: Double) {
        id = UUID()
        self.year = year
        self.population = population
    }
}

struct PetDataSeries: Identifiable {
    let type: String
    let petData: [PetData]
    var id: String { type }
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
    let catData: [PetData] = [
        PetData(year: 2000, population: 6.8),
        PetData(year: 2010, population: 8.2),
        PetData(year: 2015, population: 12.9),
        PetData(year: 2022, population: 15.2),
    ]
    let dogData: [PetData] = [
        PetData(year: 2000, population: 5),
        PetData(year: 2010, population: 5.3),
        PetData(year: 2015, population: 7.9),
        PetData(year: 2022, population: 10.6),
    ]
    var data: [PetDataSeries] {
        [
            PetDataSeries(type: "cat", petData: catData),
            PetDataSeries(type: "dog", petData: dogData),
        ]
    }

    let linearGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color.accentColor.opacity(0.4), Color.accentColor.opacity(0),
        ]),
        startPoint: .top,
        endPoint: .bottom)

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    WelcomeBubbleView()
                    HomeSectionHeader(title: "Today's Stats")
                    MetricsView()
                        .background(Color(UIColor.secondarySystemBackground))

                    HomeSectionHeader(title: "Recent Workouts")
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach($viewModel.workouts, id: \.id) { $workout in
                                NavigationLink(
                                    destination: WorkoutView(workout: $workout)
                                ) {
                                    workoutCard(workout: workout)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    DashboardView()
                        .padding(.horizontal, 16)
                }
                .padding(.bottom, 24)
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
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
