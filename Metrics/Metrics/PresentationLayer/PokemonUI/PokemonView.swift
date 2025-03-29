import SwiftUI

struct PokemonView: View {
    @State private var viewModel = PokemonViewModel()
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Enter Pokemon name", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if viewModel.isFetching {
                ProgressView()
            } else {
                Button("Search") {
                    viewModel.fetchPokemon(name: searchText)
                }
                .padding()
            }

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
        .onAppear {
            viewModel.fetchPokemon(name: "charizard")
        }
    }
}

#Preview {
    PokemonView()
}
