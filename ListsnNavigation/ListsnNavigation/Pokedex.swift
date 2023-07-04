//
//  Pokedex.swift
//  ListsnNavigation
//
//  Created by Jordy Yeoman on 4/7/2023.
//

import Foundation

struct NameLanguage: Hashable, Codable {
    var english: String
    var japanese: String
    var chinese: String
    var french: String
}

struct BaseStats: Hashable, Codable {
    var hp: Int
    var attack: Int
    var defense: Int
    var spAttack: Int
    var spDefense: Int
    var speed: Int
    
    private enum CodingKeys : String, CodingKey {
        case hp = "HP"
        case attack = "Attack"
        case defense = "Defense"
        case spAttack = "SP. Attack"
        case spDefense = "SP. Defense"
        case speed = "Speed"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hp = try container.decode(Int.self, forKey: .hp)
        attack = try container.decode(Int.self, forKey: .attack)
        defense = try container.decode(Int.self, forKey: .defense)
        spAttack = try container.decode(Int.self, forKey: .spAttack)
        spDefense = try container.decode(Int.self, forKey: .spDefense)
        speed = try container.decode(Int.self, forKey: .speed)
    }
}

struct PokedexItem: Hashable, Codable {
    var id: Int
    var name: NameLanguage
    var type: [String]
    var base: BaseStats
}
