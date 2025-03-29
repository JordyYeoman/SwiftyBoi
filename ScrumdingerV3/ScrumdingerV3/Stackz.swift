//
//  Stackz.swift
//  ScrumdingerV3
//
//  Created by Jordy Yeoman on 3/2/2025.
//

import SwiftUI

struct Stackz: View {
    @State private var value = ""
    @State var viewModel = StackzViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 4) {
                TextField(
                    viewModel.placeholder,
                    text: $viewModel.textBinding
                )
                .multilineTextAlignment(.center)
                .font(.system(.largeTitle, weight: .bold))
                .keyboardType(.decimalPad)
                .onChange(of: viewModel.textBinding) { oldValue, newValue in
                    viewModel.formatText(text: newValue)
                }

                Text("Hello")
                    .font(.caption2)
                    .padding(.bottom, 24)
//                TextField(
//                    viewModel.placeholder,
//                    text: $value
//                )
//                .multilineTextAlignment(.center)
//                .keyboardType(.decimalPad)
//                .onChange(of: value) { oldValue, newValue in
//                    let formattedValue = newValue.replacingOccurrences(of: "$", with: "")
//                    self.value = "$\(formattedValue)"
//                }
//                .font(.system(.largeTitle, weight: .bold))
//                Text("Hello")
//                    .font(.caption2)
            }
        }
        .padding(16)
        .background(.yellow, in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    Stackz()
}
