//
//  Day1View.swift
//  AdventOfCode2024
//
//  Created by Jordy Yeoman on 2/12/2024.
//

import SwiftUI

struct Day1View: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                    solve()
                }
        }
    }
}

#Preview {
    Day1View()
}
