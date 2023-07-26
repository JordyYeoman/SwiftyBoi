//
//  ContentView.swift
//  ListsnNavigation
//
//  Created by Jordy Yeoman on 4/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pokedexList: [PokedexItem] = []
    
    var body: some View {
        VStack(spacing: 10){
            Circle()
                .foregroundColor(.secondary)
                .frame(width: 120, height: 120)
            
            Text("Username")
                .bold()
                .font(.title3)
            
            Text("This is where the description of the pokemon stats.")
                .padding()
            
            Spacer()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
