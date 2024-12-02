//
//  ContentView.swift
//  Simple App
//
//  Created by Jordy Yeoman on 21/11/2024.
//

import SwiftUI

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
struct Largest {
    var kind: String
    var number: Int
}

func doStuff() {
    print("emptyArray", emptyArray)
    print("emptyDictionary", emptyDictionary)
    
    var largest = Largest(kind: "", number: 0)
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest.number {
                largest.kind = kind
                largest.number = number
            }
        }
    }
    print("largest num: ", largest)
    
    
    //
    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)
    // Prints "128"


    var m = 2
    repeat {
        m *= 2
        print(m)
    } while m < 100
    print(m)
    // Prints "128"
    
    // Index in a loop
    for i in 1...100 {
        print(i)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    doStuff()
                }
            Text("Hello, world!")
            Text("Wow")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
