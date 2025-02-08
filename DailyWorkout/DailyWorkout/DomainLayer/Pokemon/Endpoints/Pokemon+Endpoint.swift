import Foundation

struct PokemonEndpoint {
    static let baseURL = "https://pokeapi.co/api/v2"
    
    static func getPokemon(name: String) -> URLRequest {
        let urlString = "\(baseURL)/pokemon/\(name.lowercased())"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
