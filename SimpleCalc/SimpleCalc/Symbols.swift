//
//  ContentView.swift
//  SimpleCalc
//
//  Created by Jordy Yeoman on 20/11/2024.
//

import SwiftUI

struct SymbolsView: View {
    @State private var username: String = ""
    @State private var shouldBounce: Bool = false
    @State private var shouldRotate: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundStyle(.tint)
                .symbolEffect(.wiggle)
            Image(systemName: "globe")
                .font(.largeTitle)
                .foregroundStyle(.tint)
                .symbolEffect(.pulse)
            Image(systemName: "globe")
                .font(.largeTitle)
                .foregroundStyle(.tint)
                .symbolEffect(.rotate)
            Image(systemName: "person.crop.circle.badge.plus")
                .font(.largeTitle)
                .foregroundStyle(.tint)
                .symbolEffect(.bounce, value: shouldBounce)
                .onTapGesture {
                    shouldBounce.toggle()
                }
            Image(systemName: "arrow.clockwise.square")
                .font(.largeTitle)
                .foregroundStyle(.blue.mix(with: .red, by: 0.75))
                .symbolEffect(.rotate, value: shouldRotate)
                .onTapGesture {
                    shouldRotate.toggle()
                }
        }
        .padding()
    }
}

#Preview {
    SymbolsView()
}
