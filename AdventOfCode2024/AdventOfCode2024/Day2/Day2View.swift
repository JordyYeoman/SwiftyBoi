//
//  Day1View.swift
//  AdventOfCode2024
//
//  Created by Jordy Yeoman on 2/12/2024.
//

import SwiftUI

struct Day2View: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                    solveDay2()
                }
        }
    }
}

#Preview {
    Day2View()
}
