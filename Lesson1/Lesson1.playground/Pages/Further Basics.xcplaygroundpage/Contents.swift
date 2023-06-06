import Foundation

// String literal is a set of characters surrounded by ""

// Assigning a string to a constant - it is immutable
let test1 = "Jordy"
let test2 = "Amara"
var test3 = "Test"

test3 = "No test"

var myString = ""

if myString.isEmpty {
    print("Yooo string has no value iniittt")
}

// String interpolation
let name = "Jordy"
let age = 28

print("Yo, it's \(name). I am \(age)")

// String comparison
let nameComp = "jordy"
let name2Comp = "jOrDy"

if (nameComp == name2Comp.lowercased()) {
    print("Names are the same!!")
}

if (nameComp.contains("or")) {
    print("Name contains 'or'.")
}

let isVowel: Character = "e"

switch isVowel {
    case "a", "e", "i", "o", "u":
        print("Yo its a vowel!")
    default:
        print("Not a vowel!")
}

// Functions + argument labels
func testName(label1 firstName: String, label2 lastName: String) {
    print("Hey it's \(firstName) \(lastName).")
}

testName(label1: "Jordy", label2: "Yeoman")

// Using the '_' underscore to ommit labels for function parameters
// Or Don't include the _ and you will have to refer to the argument name
func simpleAddition(_ numberOne: Double, _ numberTwo: Double) -> Double {
    let res = numberOne + numberTwo
    print("Answer is \(res)")
    return res
}

simpleAddition(10.1111111, 20.9151)

// Supplying default values to function arguments
func faveDrink(drink: String, timeOfDay: String = "morning") {
    print("I love to drink: \(drink), usually I drink this in the: \(timeOfDay)")
}

faveDrink(drink: "water")
faveDrink(drink: "water", timeOfDay: "afternoon")

// Since Swift 5.1 you can even omit the return from a single line function with a defined
// return type
func multiplyBigOrse(numberOne: Int, numberTwo: Int) -> Int {
    return numberOne * numberTwo
}
// However, if you don't include the return type, you will only recieve the '()' back
func multiply(n1: Int, n2: Int) -> Int {
    n1 * n2
}

func m(n1: Int, by n2: Int) -> Int {
    n1 * n2
}

var resultOfMultiply = multiplyBigOrse(numberOne: 10, numberTwo: 20)
var r = multiply(n1: 710, n2: 20)
var z = m(n1: 9, by: 7)

print(resultOfMultiply)
print(r)
print(z)
