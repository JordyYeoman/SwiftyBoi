import Foundation

struct Monster {
    var health: Int = 5 // Init with default value - eg 'All monsters start with 5 health'
    
    // Remember that 'amount' is the name of variable in the function
    // But when calling the method, it will use the label - ' (by: 15) '
    mutating func IncreaseHealth(by amount: Int) {
        health += amount
    }
    
    mutating func DecreaseHealth(by amount: Int) {
        health += amount
    }
    
    mutating func ResetHealth() {
        health = 0
    }
}

var mon1 = Monster() // Init with default health value
mon1.IncreaseHealth(by: 20)

print(mon1)

// Computed properties
struct Weight {
    var kilograms: Double
    
    // Computed property
    // The calculation will be run everytime the default value is updated (eg - kilograms)
    var pounds: Double {
        kilograms * 2.205
    }
}

// Property observers
// Swift allows you to observe any property and respond to the changes in the property's value
// Property observers are called everytime an observed property is set.

struct GameState {
    var lives: Int = 0 {
        willSet {
            print("About to set total lives to \(newValue)")
        }
        didSet {
            if(lives > 1) {
                print("You have gained some lives, total lives gained: \(abs(oldValue - lives))")
            }
        }
    }
}

var game = GameState()
game.lives = 10



// Type properties and methods
// Useful when a property is related to a type, but not a characteristic of the instance itself

// eg -
struct Temp {
    static var boilingPoint = 100
}

// Access type properties using the dot notation

// A good example of the dot notation type method, is with a double.
var x = Double.maximum(100, 200)


// Structs by default are pass by value! Meaning they are copied when assigned to a new variable or
// an instance is passed into a function

struct Monsta {
    var name: String
    var power: Double
}

var m = Monsta(name: "Lawyer", power: 23.2)
var z = m

m.power = 29.1
print(m) // Since Monsta has been passed by value, a copy is assigned and therefore the power property has not been updated on the z assigned instance.
print(z)

