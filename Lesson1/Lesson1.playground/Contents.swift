import UIKit

var greeting = "Hello, playground"

print(greeting)

var greeting2 = "Hello lil homie"

print(greeting2)

// Full send

// Constants in swift are defined with the let keyword
let name = "Jordy Yeoman"
var street = "Hangar 7, Veldin"
print(street)
street = "Kyzil Plateau"
print(street)

struct Life {
    var initialLife = 0
    var currentLife = 0
    let name: String
    let street: String
    
    func sayHello() {
        print("Hello there! My name is \(name) and I'm from: \(street).")
    }
    
    func fookinSendIt() {
        print("Yeh nah yeah nah... yeh nahhhh")
    }
}

let j = Life(initialLife: 0, currentLife: 0, name: name, street: street)
print(j.street)
print(j.initialLife)
j.sayHello()
j.fookinSendIt()


for _ in 1...3 {
    print("Yooo")
}

