//
//  PokemonDetailView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import Foundation
import SwiftUI

struct PokemonDetailView: View {
    // Don't need to init below since it already is part of the environment from the parent view
    @EnvironmentObject var vm: PokemonViewModel
    let wallSpacing = 15.0
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            BackgroundCircleOverlay()
            VStack {
                HStack {
                    // Poke Circle
                    Spacer()
                    Circle()
                        .strokeBorder(.blue)
                        .frame(width: 25, height: 25)
                        .offset(x: 0, y: -15)
                        .padding(.trailing, 20)
                }
                
                HStack(alignment: .center) {
                    // Left Arrow
                    ArrowView(direction: "left")
                        .padding(.leading, wallSpacing)
                    Spacer()
                    // Pokemon Image
                    PokemonView(dimensions: 200, pokemon: pokemon)
                    Spacer()
                    // Right Arrow
                    ArrowView(direction: "right")
                        .padding(.trailing, wallSpacing)
                        .environmentObject(vm)
                }
                .padding(.bottom, 20)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(pokemon.name.capitalized)")
                            .font(.system(size: 32, weight: .regular, design: .monospaced))
                            .padding(.bottom, 0)
                        
                        Text("#\(vm.pokemonDetails?.id ?? 0)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                            .padding(.bottom, 16)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, wallSpacing)
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Lv.\(vm.pokemonDetails?.weight ?? 0)")
                            .font(.system(size: 16, weight: .bold, design: .monospaced))
                        
                        Text("Evolution")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .padding(.bottom, 16)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, wallSpacing)
                }
                
                Spacer()
            }
            
            
            VStack {
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
            .padding(.top, 100)
            .onAppear {
                vm.getPokemonDetails(pokemon: pokemon)
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(PokemonViewModel())
    }
}

struct BackgroundCircleOverlay: View {
    var body: some View {
        ZStack {
            VStack {
                Color.yellow
                    .clipShape(Circle())
                Color.clear
            }
            .scaleEffect(2)
        }
        .edgesIgnoringSafeArea(.all)
        .offset(x: 0, y: -80)
    }
}

struct ArrowView: View {
    @EnvironmentObject var vm: PokemonViewModel
    var direction: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .shadow(radius: 10)
            Circle()
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
            Image(systemName: "chevron.\(direction).circle.fill")
                .foregroundColor(.white)
                .font(.system(size: 30.0))
        }
//        .onTapGesture {
//            print("Hello sir: \(vm.pokemonIndex)")
//            vm.updatePokemonIndex(updateBy: 1)
//        }
    }
}
