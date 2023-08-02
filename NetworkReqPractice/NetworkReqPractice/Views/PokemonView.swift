//
//  PokemonView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import SwiftUI

struct PokemonView: View {
    var dimensions: Double
    
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonId(pokemon: pokemon)).png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: dimensions, height: dimensions)
            .background(.thinMaterial)
            .cornerRadius(8)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(dimensions: 140, pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}
