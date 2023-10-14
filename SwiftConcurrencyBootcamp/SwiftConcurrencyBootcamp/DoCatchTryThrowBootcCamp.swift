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
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("NEW TITLE!!!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    // Improved version
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW TITLE!!!")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    // Improved further with throws
    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT AGAIN!!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchTryThrowBootCampViewModel: ObservableObject {
    
    @Published var text: String = "Starting text..."
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    //    func fetchTitle() {
    //        let returnedValue = manager.getTitle()
    //        if let newTitle = returnedValue.title {
    //            self.text = newTitle
    //        } else if let error = returnedValue.error {
    //            self.text = error.localizedDescription
    //        }
    //    }
    
    //    func fetchTitle() {
    //        let result = manager.getTitle2()
    //
    //        switch(result) {
    //        case .success(let newTitle):
    //            self.text = newTitle
    //        case .failure(let error):
    //            self.text = error.localizedDescription
    //        }
    //    }
    
    func fetchTitle() {
        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch {
            self.text = error.localizedDescription
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
