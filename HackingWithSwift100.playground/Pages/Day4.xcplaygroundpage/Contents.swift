import Foundation

// functions, return types and params
func testMethod(input: String, num: Int) -> Int {
    print(input)
    return num * num
}

let res = testMethod(input: "Send it", num: 6)
print(res)

// Swift also gives us the option to use labels
// Think of labels as the param name that is externally facing
// eg
func sendIt(to whereToSendIt: String) -> Void {
    print("Sending it to \(whereToSendIt)")
}

sendIt(to: "The Moon!!")


// Basic closure
let jordySendIt = {
    print("Alright, lets go!!")
}

jordySendIt()

// Closures taking arguments

let runCode = { (language: String) in
    print("Executing code in \(language) & appropriate runtime.")
}

// Difference between closures and normal functions, is closures remove the need for an argument label.
runCode("Swift")

// Closures that return a value
let driving = { (place: String) -> String in
    return "I'm driving to \(place)."
}

let newHome = driving("Hello")
print(newHome)

// Passing a closure as a function param
// function
func doSomethingMagical(action: () -> Void) {
    print("Doing some magic trick...")
    action()
}

// Closure
let sleightOfHand = {
    print("Bra we just pulled a fast one on yah")
}

// pre cool!!
// Calling the function by passing in the closure
doSomethingMagical(action: sleightOfHand)

