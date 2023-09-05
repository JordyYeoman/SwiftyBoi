//: [Previous](@previous)

import Foundation

// Memberwise initialisers
struct User {
    var username: String
}

struct User2 {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user")
    }
}

var user = User(username: "JSwizzle")
// var user2 = User2(username: "Poo") - This errors out because we cannot add this value as part of the initialiser
// Instead to override the username, we do ' user2.username = "testJordy" '

struct User3 {
    var name: String
    
    init(name: String) {
        print("Homie is: \(name)")
        // self helps us distinguish between the parameter provided to the function and the class property
        self.name = name
    }
}

var user3 = User3(name: "Jeman")
