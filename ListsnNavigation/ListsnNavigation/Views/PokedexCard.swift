//
//  ContentView.swift
//  ListsnNavigation
//
//  Created by Jordy Yeoman on 4/7/2023.
//

import SwiftUI

struct PokedexCard: View {
    
    @State private var pokedexList: [PokedexItem] = []
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                VStack {
                    Circle()
                        .foregroundColor(.secondary)
                        .frame(width: 20, height: 20)
                    Spacer()
                }
                Spacer()
                Circle()
                    .foregroundColor(.secondary)
                    .frame(width: 120, height: 120)
                Spacer()
                VStack {
                    Text("Lv.91")
                        .bold()
                        .font(.caption)
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 130, alignment: .leading)
            .padding(20)
            
            
            Text("Pokemon Name")
                .bold()
                .font(.title3)
            
            Text("This is where the description of the pokemon stats.")
                .padding()
            
            Text("This is where the description of the pokemon stats.")
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexCard()
    }
}
