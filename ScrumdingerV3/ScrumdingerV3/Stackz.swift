//
//  Stackz.swift
//  ScrumdingerV3
//
//  Created by Jordy Yeoman on 3/2/2025.
//

import SwiftUI

struct Stackz: View {
    @State private var isActive = false
    @State var textBinding = ""
    private let placeholder: String = "Test"
    
    var body: some View {
        ZStack {
            VStack(spacing: 4) {
                TextField(
                    placeholder,
                    text: $textBinding
                )
                .font(.system(.largeTitle, weight: .bold))
                Text("Hello")
                    .font(.caption2)
            }
            .opacity(0)

            VStack(spacing: 4) {
                TextField(
                    placeholder,
                    text: $textBinding
                )
                .font(.system(.largeTitle, weight: .bold))
                
                if textBinding.isEmpty {
                    Text("Hello")
                        .font(.caption2)
                }
            }
        }
        .padding(16)
        .background(.yellow, in: RoundedRectangle(cornerRadius: 16))
        
        Button(action: {
            isActive.toggle()
        }, label: {
            Text("Toggle")
        })
    }
}

#Preview {
    Stackz()
}
