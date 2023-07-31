//
//  PokemonDetailView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    // Don't need to init below since it already is part of the environment from the parent view
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
        }
        .onAppear {
            vm.getPokemonDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}
