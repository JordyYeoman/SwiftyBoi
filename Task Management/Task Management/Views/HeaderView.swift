//
//  HeaderView.swift
//  Task Management
//
//  Created by Jordy Yeoman on 17/10/2023.
//

import SwiftUI

struct HeaderView: View {
    // Task Manager properties
    @State private var currentDate: Date = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 5) {
                Text(currentDate.format("MMMM"))
                    .foregroundColor(.blue)
                
                Text(currentDate.format("YYYY"))
                    .foregroundColor(.gray)
            }
            .font(.title.bold())
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.callout)
                .fontWeight(.semibold)
                .scaledToFit()
                .foregroundStyle(.gray)
        }
        .hSpacing(.leading)
        .overlay(alignment: .topTrailing, content: {
            VStack(alignment: .center) {
                Spacer()
                Button(action: {}, label: {
                    Image("headshot_test_profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                })
                Spacer()
            }
        })
        .padding(15)
        .background(.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
