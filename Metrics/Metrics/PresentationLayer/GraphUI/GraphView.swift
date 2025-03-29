//
//  GraphView.swift
//  Metrics
//
//  Created by Jordy Yeoman on 26/3/2025.
//

import SwiftUI

struct GraphView: View {
    @State private var viewModel = GraphViewModel()

    var body: some View {
        if viewModel.isFetching {
            ProgressView()
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(
            action: {
                viewModel.fetchData()
            },
            label: {
                Text("Click me")
            }
        )
    }
}

#Preview {
    GraphView()
}
