//
//  HomeView.swift
//  AboutMeApp
//
//  Created by Jordy Yeoman on 29/11/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()


            AsyncImage(url: URL(string: information.image)){ result in
                        result.image?
                            .resizable()
                            .scaledToFill()
                    }
            .frame(width: 200, height: 200, alignment: .topTrailing)
                    .cornerRadius(200)


            Text(information.name)
                .font(.title)
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
