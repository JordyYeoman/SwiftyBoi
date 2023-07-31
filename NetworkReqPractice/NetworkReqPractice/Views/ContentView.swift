//
//  ContentView.swift
//  NetworkReqPractice
//
//  Created by Jordy Yeoman on 30/7/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            Text("Send itttt")
                .fontWeight(.semibold)
                .font(.title)
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
