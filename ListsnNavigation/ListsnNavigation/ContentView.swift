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
                let jsonData = try decoder.decode(JSONData.self, from: data)
                return jsonData.pokedexList
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
