//
//  PokemonViewModel.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import Foundation
import SwiftUI

final class PokemonViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonIndex = 0
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func updatePokemonIndex(updateBy: Int) {
        DispatchQueue.main.async {
            print("updateBy: \(updateBy)")
            print("pokemonIndex: \(self.pokemonIndex)")
//            self.pokemonIndex += updateBy
            self.pokemonIndex = 23
        }
    }
    
    func getPokemonId(pokemon: Pokemon) -> Int {
        print("Getting pokemon index")
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            DispatchQueue.main.async {
                self.pokemonIndex = index + 1
            }
            return index + 1
        }
        return 0
    }
    
    func getPokemonDetails(pokemon: Pokemon) {
        self.pokemonDetails = DetailPokemon(id: 0, height: 0, weight: 0, sprites: PokemonSprite(front_default: "", back_default: ""))
        
        pokemonManager.getDetailedPokemon(id: self.pokemonIndex) { data in
            // TODO: Look into why we need to call the Dispatch.main thread??
            // Why we do dis - Update the main thread?
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let str = String(format: "%.2f", dValue / 10)
        
        return str
    }
}
