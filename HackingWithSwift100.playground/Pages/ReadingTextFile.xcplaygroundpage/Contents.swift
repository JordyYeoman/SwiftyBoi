//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

extension String {
    // Get the filename for a string
    func fileName() -> String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    
    // Get the file extension for a sting
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}

func readFile(inputFileName: String, fileExtension: String) -> [String] {
    // Get the file URL
    let fileURL = Bundle.main.url(forResource: inputFileName, withExtension: fileExtension)
    
    // Get the data
    if((fileURL) != nil) {
        if let data = try? String(contentsOf: fileURL!) {
            return data.components(separatedBy: "\n")
        }
    }
    return [""]
}

var myData = readFile(inputFileName: "testing", fileExtension: "txt")

struct deque<T> {
    var array = [T]()
    var count: Int {
        return array.count
    }
    var arraySummed: Int {
        if let intArray = array as? [Int] {
            return intArray.reduce(0, { x, y in x + y })
        } else {
            return 0
        }
    }
    
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    
    mutating func popBack() -> T? {
        return array.popLast()
    }
    
    mutating func popFront() -> T? {
        if array.first == nil {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    mutating func solveSubArr(numToAchieve: Int) -> Int {
        while count > 0 {
            if(arraySummed == numToAchieve) {
                return arraySummed
            } else {
                self.popBack()
            }
        }
        
        return -1
    }
}

var testNumbers = deque<Int>()
testNumbers.pushFront(3)
testNumbers.pushBack(2)
testNumbers.pushFront(1)
print(testNumbers)
testNumbers.popFront()
print(testNumbers)

// Given an integer array nums and an integer k,
// return the length of the shortest non-empty subarray of nums with a sum of at least k.
// If there is no such subarray, return -1.

// A subarray is a contiguous part of an array.

// Example 1:
//
// Input: nums = [1], k = 1
// Output: 1
// Example 2:
//
// Input: nums = [1,2], k = 4
// Output: -1
// Example 3:
//
// Input: nums = [2,-1,2], k = 3
// Output: 3

class Solution {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        // Implement a moving window until we find the smallest length of array that can satisfy our number
        var dq = deque(array: nums)
        return dq.solveSubArr(numToAchieve: k)
    }
}

let sol = Solution()
print(sol.shortestSubarray([1], 1))
print(sol.shortestSubarray([1, 2], 4))
print(sol.shortestSubarray([2,-1,2], 3))
