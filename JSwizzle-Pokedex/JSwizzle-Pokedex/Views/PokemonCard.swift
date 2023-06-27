import SwiftUI

struct PokemonCard: View {
    var pokemonDetails = ""
    @State private var pokemonDetailsStuff = ""
    
    var body: some View {
        Text("Pokemon Name: \(pokemonDetails)")
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard()
    }
}
