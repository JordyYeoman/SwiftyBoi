//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 25/11/2024.
//

import SwiftUI

struct UserProfileImage: View {
    var body: some View {
        Image(.ironman)
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50, alignment: .top)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 4)
    }
}

#Preview {
    UserProfileImage()
}
