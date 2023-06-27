//
//  PokemonImage.swift
//  JSwizzle-Pokedex
//
//  Created by Jordy Yeoman on 27/6/2023.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSpriteURL = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSpriteURL))
            .frame(width: 75, height: 75)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("newURLCaching")
                } else {
                    getSprite(url: loadedData!)
                    print("using cached url")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.6))
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSpriteURL = tempSprite ?? "placeholder.png"
            
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
