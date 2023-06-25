import Foundation

// https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151

struct Pokemon: Codable {
    var results: [PokemonEntry]
}

// Codable - From the AppleDocs - A type that can convert itself into and out of an external representation.
// Identifiable - "" ^ - hold the value of an entity with stable identity.
struct PokemonEntry: Codable, Identifiable {
    
}
