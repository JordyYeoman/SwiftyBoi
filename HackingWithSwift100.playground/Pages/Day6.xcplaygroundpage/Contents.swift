import Foundation

// When to use a tuple vs a struct?
// If the value is just once off, then use a tuple, if you re-use the object -> struct

struct Sport {
    // Stored properties
    var name: String
    var isOlympicSport: Bool
    
    // Computed Property
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

let fpsGameMaster = Sport(name: "COD Champion", isOlympicSport: false)
print(fpsGameMaster.name);
print(fpsGameMaster.isOlympicSport);

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Methods and mutating methods in structs

struct BigOrse {
    var strength: Int
    
    mutating func goGym() {
        strength += 10
    }
}

var jordy = BigOrse(strength: 5)
print(jordy.strength)
jordy.goGym()

for i in 1...10 {
    jordy.goGym()
}

print(jordy.strength)

let river = BigOrse(strength: 1)
print(river.strength)
// river.goGym() - error: cannot use mutating member on immutable value
// Cannot call a mutating method on a struct assigned to a constant variable.


// Why do we want an init here?
struct Person {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
}

let ed = Person(id: "12345")
// Using the private keyword, we can no longer override the id property
//ed.id = "123" // Error - id is inaccessble

