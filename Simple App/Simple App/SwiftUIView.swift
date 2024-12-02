//
//  SwiftUIView.swift
//  Simple App
//
//  Created by Jordy Yeoman on 22/11/2024.
//

import SwiftUI

//  [Int, (x: CGFloat, y: CGFloat)]
let positionMap = [
    1: (x: 150, y: -150),
    2: (x: -75, y: -100),
    3: (x: 150, y: 150)
]

struct SwiftUIView: View {
    @State private var shouldBounce: Bool = false
    @State private var shouldRotate: Bool = false
    @State private var position: Int = 1
    
    func doStuff() {
        if position < positionMap.count {
            position += 1
        } else {
            position = 1
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.clockwise.square")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .symbolEffect(.rotate, value: shouldRotate)
                .onTapGesture {
                    shouldRotate.toggle()
                }
                .offset(x: CGFloat(positionMap[position]?.x ?? 0), y: CGFloat(positionMap[position]?.y ?? 0))
            
            Text("Hello World")
                .background(.pink)
                .onTapGesture {
                    doStuff()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)

    }
}

#Preview {
    SwiftUIView()
}
