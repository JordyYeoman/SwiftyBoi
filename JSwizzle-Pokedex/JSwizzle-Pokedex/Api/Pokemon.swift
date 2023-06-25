import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

// Codable - From the AppleDocs - A type that can convert itself into and out of an external representation.
// Identifiable - "" ^ - hold the value of an entity with stable identity.
struct PokemonEntry: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

class PokeApi {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        else {
            return
        }
    }
}
