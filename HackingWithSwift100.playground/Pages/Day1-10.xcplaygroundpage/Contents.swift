import Foundation

// Multiline strings
// 3 Quotes need to be on their own line
var testMultiLnStr = """
Yo its jordy mannnnnnnnn. Time to send it!
Turning coffee to code
"""

// D2 - Arrays
let j = "Test"
let k = "Test2"
let z = "Test3"

let testArr = [j, k, z]
print(testArr[0])

// Sets vs arrays
// Sets store data randomly in memory - but optimized for performance (fast retrieval)
// Where as arrays store items in consequential perf

var arrayOfBlogCategories: [String] = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]
var setOfBlogCategories: Set<String> = ["Swift", "Debugging", "Xcode", "Workflow", "Optimization"]

print(arrayOfBlogCategories)
// You can see when we print out the set, order is different. Retrieval of a set does not maintain any ordering
print(setOfBlogCategories)

// Remember 'Value Type' — each instance keeps a unique copy of its data
// Both arrays and sets are value types, therefore if you define them as constant 'let', Swift compiler
// will throw an error
arrayOfBlogCategories.append("Jordy")
let (inserted, memberAferInsert) = setOfBlogCategories.insert("Testing") // return after insert is a boolean and next set member
if !inserted {
    print("Failed to insert, duplicate property exists")
}
print(inserted)

// But how about NSOrderedSet?
// NSOrderedSet comes with a cost - non-generic type with any objects, type casting everywherel

// TLDR
// Array - Order is important, duplicate items possible, performance less important
// Set - Order is not important, unique elements required, performance more important

// Sets conform to the hashable protocol, Sets large or small have the exact same lookup time.



// What's the difference between tuples and Structs in Swift????
// - use TUPLES when you want to return two or more arbitrary pieces of values from a function
// - prefer STRUCTS when you have some fixed data you want to send or receive multiple times.

// Dictionaries and default values when the lookup key returns nil
var dic: [String: Int] = [
    "Math": 99,
    "Engineering": 91,
    "Medicine": 94
]

var favoriteColors = Dictionary<String, String>()

var cap = favoriteColors.capacity
favoriteColors["Jordy"] = "Yeoman"
print(favoriteColors)

let medAvg = dic["medicine", default: 0]
let medAvg2 = dic["Medicine", default: 0]
print(medAvg) // Failed lookup defaults to 0
print(medAvg2)



// Enums and associated values
enum Food {
    case vegetable
    case meat
    case grain(amount: Int)
}

print(Food.grain(amount: 10))

// Adding a type to the enum cases, allows you to return a raw value of that type when accessed
enum SchoolTestResults: String {
    case Pass
    case Fail
    case NA
}
// EG
print(SchoolTestResults.Pass.rawValue) // 'Pass', but if it was an Int -> it would return 0

// We can also define an enum property with a self explaining name, which will return

enum TestingEnums: String {
    case hello
    case world
    case what
    case dawg
    
    // With a title property - we can return a specific string for
    // each case, instead of the string representation of the raw value
    var title: String {
        switch self {
        case .hello:
            return "Welcome to RocketSim"
        case .world:
            return "Grids to align"
        case .what:
            return "Rulers for precision"
        case .dawg:
            return "Select Xcode"
        }
    }
}

var x = TestingEnums.hello // Raw value - 'hello'
var y = TestingEnums.hello.title // title reference for case - "Welcome to RocketSim"

// Enums can be even more powerful using the CaseIterable protocol - TLDR loop over enum values
// Use the 'allCases' property, available once adding 'CaseIterable' to an enum
enum SendIt: String, CaseIterable {
    case OneBeer
    case TwoBeers
    case ThreeBeers
    case FourBeers
}

SendIt.allCases.forEach { sendIt in
    print(sendIt.rawValue)
}

// 1. Create, add and utilise each of the following complext types - array, tuple, set, dictionary

// Array
var t: Array<String> = ["Name", "Age"]
print(t)

// Tuple
var e = (Age: 22, isHappy: true)
print(e)

// Set
var testSet: Set<String> = ["Name", "Age"]
print(testSet)

// Dictionary
var testDic: Dictionary<Int, String> = ([1: "Jordy", 2: "Amara", 3: "Layla"])
print(testDic)
