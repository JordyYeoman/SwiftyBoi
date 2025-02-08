import SwiftUI

struct ListSectionHeader: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            Spacer()
        }
    }
}

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    @Published var error: APIError?
    private let service: Service

    init(service: Service = APIService()) {
        self.service = service
    }

    func fetchPokemon(name: String) {
        let request = PokemonEndpoint.getPokemon(name: name)
        service.makeRequest(with: request, respModel: Pokemon.self) {
            [weak self] pokemon, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.error = error
                    return
                }
                self?.pokemon = pokemon
            }
        }
    }
}

struct HomeView: View {
    let service = APIService()
    @State private var workouts = Workout.sampleData
    @State var isFirstLaunch: Bool = true
    let username: String = "Jordy"
    @StateObject private var viewModel = PokemonViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Enter Pokemon name", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Search") {
                viewModel.fetchPokemon(name: searchText)
            }
            .padding()

            if let pokemon = viewModel.pokemon {
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) {
                        image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }

                    Text("Name: \(pokemon.name.capitalized)")
                    Text("ID: \(pokemon.id)")
                    Text("Height: \(pokemon.height)")
                    Text("Weight: \(pokemon.weight)")
                }
            }

            if let error = viewModel.error {
                Text("Error: \(String(describing: error))")
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()

        }
        NavigationStack {
            HStack {
                Text("Welcome \(isFirstLaunch ? "" : "back,") \(username)")
                    .onAppear {
                        isFirstLaunch = false
                    }
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding()
                    .foregroundStyle(.white)
                Spacer()
            }
            .background(.retroLightPurple)
            .onAppear {
                viewModel.fetchPokemon(name: "charizard")
            }

            List {
                Section(header: ListSectionHeader(title: "Recent Workouts")) {
                    ForEach($workouts, id: \.id) { $workout in
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
    }
}

#Preview {
    HomeView()
}
