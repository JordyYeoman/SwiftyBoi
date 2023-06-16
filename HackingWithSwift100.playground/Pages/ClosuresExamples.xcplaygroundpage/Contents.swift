import Foundation

// Closures are just functions that you can pass around

func funcWithParameter(param: (() -> String)) {
    print(param())
}

func greeting() -> String {
    return "Hello World"
}

funcWithParameter(param: greeting)
