//
//  PokemonModel.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 31/7/2023.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/")
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    let sprites: PokemonSprite
}

struct PokemonSprite: Codable {
    let front_default: String
    let back_default: String
}
