//
//  ContentView.swift
//  BasicsJSON
//
//  Created by Jordy Yeoman on 17/7/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var datas = ReadData()
    
    var body: some View {
        List(datas.users){ user in
            
            VStack(alignment: .leading) {
                
                Text(user.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.gray)
                
                HStack{
                    Text(user.designation)
                        .font(.title3)
                        .foregroundColor(Color.blue)
                    
                    Spacer()
                    Text(user.email)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
