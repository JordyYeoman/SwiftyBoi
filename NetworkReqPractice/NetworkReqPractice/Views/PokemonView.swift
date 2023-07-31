//
//  PokemonView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import SwiftUI

struct PokemonView: View {
    
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
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
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 16)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}
