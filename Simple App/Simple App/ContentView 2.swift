//
//  ContentView.swift
//  Simple App
//
//  Created by Jordy Yeoman on 21/11/2024.
//

import SwiftUI


// Tasks
// A task performs a specific job from start to finish
// Sequential - Asynchronous - Self Contained

enum DogsError: Error {
    case invalidServerResponse
    case unsupportedImage
}

func fetchPhoto(url: URL) async throws -> UIImage {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200 else {
        throw DogsError.invalidServerResponse
    }
    
    guard let image = UIImage(data: data) else {
        throw DogsError.unsupportedImage
    }
    
    return image
}


struct ConcurrentViewTest: View {
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Wow")
        }
        .padding()
    }
}

#Preview {
    ConcurrentViewTest()
}
