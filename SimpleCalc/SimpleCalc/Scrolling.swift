//
//  SwiftUIView.swift
//  SimpleCalc
//
//  Created by Jordy Yeoman on 20/11/2024.
//

import SwiftUI

struct Scrolling: View {
    var images: [ImageResource] = [.bellagio, .excalibur, .luxor, .paris, .stratosphere, .treasureisland]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(images, id: \.self) { image in
                    ScrollImage(image: image)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Scrolling()
}
