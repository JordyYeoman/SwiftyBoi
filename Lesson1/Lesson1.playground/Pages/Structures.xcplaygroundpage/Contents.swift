import Foundation

// STRUCTURES
"You can define functionality by adding type and instance methods to a structure."

extension Int {
  var doubleValue: Double {
    return Double(self)
  }
}

struct BigDog {
    var name: String
    var age: Int
    var power: Double
    var strength: Double
    
    func getAttack() -> Double {
        return self.power * self.strength - self.age.doubleValue
    }
}

func compareAttackDmg(p1: BigDog, p2: BigDog) -> BigDog {
    if(p1.getAttack() > p2.getAttack()) {
        return p1
    }
    
    return p2
}

// Create a new instance of your struct
var p1 = BigDog(name: "Jordy", age: 28, power: 71.4, strength: 42.11)
var p2 = BigDog(name: "Jacob", age: 21, power: 81.4, strength: 22.11)

var winner = compareAttackDmg(p1: p1, p2: p2)
print(winner)


// Creating and Initializing new Structures with default values
struct Odometer {
    var count: Int = 0
}

let od = Odometer()
print(od.count)

// If you don't include default initializers, you should instead use memberwise initializers
struct Person {
    var name: String
    
    func sayHello() {
        print("Hey it's \(name).")
    }
}
// Memberwise initializer
let me = Person(name: "Jordy")

// Custom Initializers for when you want to perform a sort of function during setup
struct Temperature {
    var celsius: Double
    // With custom init's you need to define your own memberwise initializers
    init(celsius: Double) {
        self.celsius = celsius
    }
    
    init(farenheit: Double) {
        celsius = (farenheit - 32) / 1.8
    }
}

let temp = Temperature(celsius: 28)
let temp2 = Temperature(farenheit: 82.8)

print(temp.celsius)
print(temp2.celsius)

// Create 2 structs representing game objects and initialize them inside a gameLoop function
struct Position {
    var x: Double
    var y: Double
}

struct PlayerCharacter {
    var name: String
    var position: Position
    var weight: Int
    var height: Double
    var weapon: String
    
    func move(x: Double, y: Double) {
        print("Moving x direction: \(x)")
        print("Moving y direction: \(y)")
    }
}

struct Planet {
    var name: String
    var distanceFromEarth: Double
    var gravity: Double
}

struct Game {
    var mainCharacter: PlayerCharacter
    var planet: Planet
    
    func gameLoop() {
        print("Game starting...")
        print(mainCharacter)
        print(planet)
    }
}

var newPosition = Position(x: 0.0, y: 0.0)
var newCharacter = PlayerCharacter(name: "Jordy", position: newPosition, weight: 103, height: 1.85, weapon: "Axe")
var newPlanet = Planet(name: "Pluto", distanceFromEarth: 7500000000, gravity: 0.62)
var newGame = Game(mainCharacter: newCharacter, planet: newPlanet)

print(newGame)
newGame.gameLoop()

