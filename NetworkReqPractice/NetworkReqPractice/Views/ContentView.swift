//
//  ContentView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 30/7/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(dimensions: 140, pokemon: pokemon)
                                .navigationTitle("Pokedex")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
