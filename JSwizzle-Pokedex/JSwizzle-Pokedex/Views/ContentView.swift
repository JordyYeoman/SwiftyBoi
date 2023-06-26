import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
//                PokeApi().getData() { pokemon in
//                    print(pokemon)
//                    print("Hello World")
//                    for pokemon in pokemon {
//                        print(pokemon.name)
//                    }
//                }
                
                PokemonSelectedApi().getData(url: "https://pokeapi.co/api/v2/pokemon/7/") { url in
                    print(url)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
