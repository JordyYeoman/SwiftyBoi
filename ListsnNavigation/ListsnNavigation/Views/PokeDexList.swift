//
//  PokeDexList.swift
//  ListsnNavigation
//
//  Created by Jordy Yeoman on 29/7/2023.
//

import SwiftUI

struct PokeDexList: View {
    @State private var pokedexList: [PokedexItem] = []
    
    var body: some View {
        VStack(spacing: 10){
            List(pokedexList, id: \.self) { pokedexItem in
                HStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(.secondary)
                            .frame(width: 50, height: 50)
                            .padding(.top, 1)
                            .cornerRadius(4)
                        Text("Type: \(pokedexItem.type[0])")
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .font(.custom("teeny", fixedSize: 10))
                    }
                    .frame(width: 60)
                    
                    VStack(alignment: .leading) {
                        Text("\(pokedexItem.name.english)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom, 1)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Attk: \(pokedexItem.base.attack)")
                                    .font(.caption2)
                                Text("Defense: \(pokedexItem.base.defense)")
                                    .font(.caption2)
                            }
                            VStack(alignment: .leading) {
                                Text("HP: \(pokedexItem.base.hp)")
                                    .font(.caption2)
                                Text("Speed: \(pokedexItem.base.speed)")
                                    .font(.caption2)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            pokedexList = loadJson(filename: "pokedex") ?? []
        }
        .padding()
    }
    
    private func loadJson(filename fileName: String) -> [PokedexItem]? {
        print("Read file Function called!!")
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                print(data)
                let pokedexList = try decoder.decode([PokedexItem].self, from: data)
                print(pokedexList)
                return pokedexList
            } catch {
                print("error happened bra:\(error)")
            }
        } else {
            print("Json file not found file:  \(fileName)")
        }
        return nil
    }
}

struct PokeDexList_Previews: PreviewProvider {
    static var previews: some View {
        PokeDexList()
    }
}
