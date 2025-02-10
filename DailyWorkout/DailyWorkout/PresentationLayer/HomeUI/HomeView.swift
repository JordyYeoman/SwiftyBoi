import SwiftUI

struct ListSectionHeader: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
    }
}

struct HomeView: View {
    @State var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if !viewModel.hasDismissedWelcomeText {
                    HStack {
                        Text(
                            "Welcome \(viewModel.isFirstLaunch ? "" : "back,") \(viewModel.username)"
                        )
                        .onAppear {
                            viewModel.isFirstLaunch = false
                        }
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()
                        .foregroundStyle(Color.retroDarkPurple)
                        Spacer()
                        Button {
                            viewModel.hasDismissedWelcomeText.toggle()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                        }
                        .padding(.trailing, 24)
                        .foregroundStyle(Color.retroDarkPurple)
                    }
                    .padding(.horizontal, 12)
                    .background(Color(UIColor.secondarySystemBackground))
                }
                
                MetricsView()
                    .background(Color(UIColor.secondarySystemBackground))

                List {
                    Section(header: ListSectionHeader(title: "Recent Workouts"))
                    {
                        ForEach($viewModel.workouts, id: \.id) { $workout in
                            NavigationLink(
                                destination: WorkoutView(workout: $workout)
                            ) {
                                Text(workout.name)
                            }
                        }
                    }

                    Section(header: ListSectionHeader(title: "Exercises")) {
                        Text("Sup Bra")
                    }

                    Section(header: ListSectionHeader(title: "Totals")) {
                        HStack {
                            Text("Weekly: ")
                            Spacer()
                            Text("2.78 Tonnes")
                        }
                        HStack {
                            Text("Daily: ")
                            Spacer()
                            Text("0.4 Tonnes")
                        }
                    }
                }
            }
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

#Preview {
    HomeView()
}
