import Observation
import SwiftUI

@Observable
class PokemonViewModel {
    private let service: Service

    var pokemon: Pokemon?
    var error: APIError?
    var isFetching: Bool = false

    init(service: Service = APIService()) {
        self.service = service
    }

    func fetchPokemon(name: String) {
        self.isFetching = true
        let request = PokemonEndpoint.getPokemon(name: name)
        service.makeRequest(with: request, respModel: Pokemon.self) {
            [weak self] pokemon, error in
            DispatchQueue.main.async {
                if let error = error {
                    self?.error = error
                    self?.isFetching = false
                    return
                }
                self?.pokemon = pokemon
                self?.isFetching = false
            }
        }
    }
}
