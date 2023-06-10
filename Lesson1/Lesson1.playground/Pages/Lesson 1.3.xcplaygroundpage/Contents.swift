import Foundation

// Goals with this lesson
// 1. Be able to explain the difference between Structs and Classes in Swift.
// 2. Better understanding of Struct instance methods

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
