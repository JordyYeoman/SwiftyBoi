import Foundation

var greeting = "Hello, playground"

//var count = 1
//
//while count <= 10000 {
//    print(count)
//    
//    count += 1
//}

var myFruitArray = ["Banana", "Apple", "Orange", "Plum", "Grapefruit", "Lemon", "Lime"]

for fruit in myFruitArray {
    print(fruit)
}

var myNumbers = [10, 20, 30, 40, 50]

func divideByX(n: Int, divider: Int) {
    print(n / divider)
}

for n in myNumbers {
    divideByX(n: n, divider: 5)
}

for myInt in 1 ... 100 {
    print(myInt / 5)
}


func checkUserEligability(userAge: Int) -> Bool {
    if userAge < 18 {
        return false
    }
    
    return true
}

let users = [12, 22, 31, 101, 2, 3, 14, 18]

for user in users {
    print("-----")
    print("User age:", user)
    
    if checkUserEligability(userAge: user) {
        print("Get on the beers.")
    } else {
        print("No beers 4 you.")
    }
}

var myName: String?
myName?.uppercased()


// Guard vs if-let
var myAge = "f"

if let myNumner = Int(myAge) {
    print("JSwizzle age: ", myAge)
} else {
    print("Wrong input")
}

enum RandomError: Error {
    case BigChad
    case SmallBoi
}

let x = 2

// So guard will only fall into the `else` block, IF the condition is FALSE.
// True will skip the `else` block.
guard x > 1 else {
    print("We out here")
    throw RandomError.BigChad
}



    
    
    
