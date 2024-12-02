//
//  StarRating.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 28/11/2024.
//

import SwiftUI

import SwiftUI

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

// Do network request
func makeCall() async throws -> [Todo] {
    print("Hello")
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    let request = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard
        data.isEmpty == false,
        let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200
    else {
        return []
    }
    
    // Do something with the data
    
    return try JSONDecoder().decode([Todo].self, from: data)
}



struct StarRating: View {
    @State private var isLoading = false
    @State private var counter = 0
    
    //    @Binding var rating: Int
    
    private let maxRating = 5
    
    var body: some View {
        Text(counter, format: .number)
        
        Button {
            isLoading = true
            Task {
                await heavyUpdate()
                isLoading = false
            }
        } label: {
            Text(isLoading ? "Cancel": "Increment")
        }
        .disabled(isLoading)
        
        Button {
            counter += 1
        } label: {
            Text("Increment Fast")
        }
    }
    
    private func heavyUpdate() async {
        do {
            print("update started")
            try await Task.sleep(for: .seconds(3))
            counter += 1
            print("update finished")
        } catch {
            print("update cancelled")
        }
    }
}

#Preview {
    StarRating()
}
