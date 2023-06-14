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
