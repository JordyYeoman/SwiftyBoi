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
        .onAppear(perform: readFile)
        .padding()
    }
    
    private func readFile() {
        print("Read file Function called!!")
        if let url = Bundle.main.url(forResource: "pokedex", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
                // TODO: Still not able to read json file data
                print(jsonData.pokedexList)
                self.pokedexList = jsonData.pokedexList
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
