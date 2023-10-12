//
//  DoCatchTryThrowBootcCamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Jordy Yeoman on 12/10/2023.
//

import SwiftUI

// do catch
// try
// throws

class DoCatchTryThrowsBootcampDataManager {
    
    let isActive: Bool = false
    
    func getTitle() -> String? {
        if isActive {
            return "NEW TITLE!!!"
        } else {
            return nil
        }
    }
}

class DoCatchTryThrowBootCampViewModel: ObservableObject {
    
    @Published var text: String = "Starting text..."
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    func fetchTitle() {
        let newTitle = manager.getTitle()
        if let newTitle = newTitle {
            self.text = newTitle
        }
    }
}

struct DoCatchTryThrowBootcCamp: View {
    @StateObject private var viewModel = DoCatchTryThrowBootCampViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 200)
            .background(Color.gray)
            .cornerRadius(4)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

struct DoCatchTryThrowBootcCamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowBootcCamp()
    }
}
