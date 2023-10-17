//
//  ViewExtensions.swift
//  Task Management
//
//  Created by Jordy Yeoman on 17/10/2023.
//

import SwiftUI

extension View {
    // Custom spacers
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
