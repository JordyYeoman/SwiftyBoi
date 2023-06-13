import Foundation

// functions, return types and params
func testMethod(input: String, num: Int) -> Int {
    print(input)
    return num * num
}

let res = testMethod(input: "Send it", num: 6)
print(res)
