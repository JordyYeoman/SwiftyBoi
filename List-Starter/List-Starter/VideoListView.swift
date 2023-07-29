//
//  VideoListView.swift
//  List-Starter
//
//  Created by Jordy Yeoman on 29/7/2023.
//

import SwiftUI

struct VideoListView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { item in
                HStack {
                    Image("average-dev")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("I'm an average developer")
                            .fontWeight(.semibold)
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                        
                        Text("January 1, 2021")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Jordy Sending It")
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
