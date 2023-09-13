//: [Previous](@previous)

import Foundation

print("YEEET")

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

// Input: nums = [7,11,1,15,1], target = 9
// Output: [0,1]

// 1. Store the count
// 2. Loop through the array, starting at index 1, then loop through at index 2 - solution will be O(n^2), since we are looping the array for each element

// Initial brute force attempt
//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var indexs = [0]
//        var count = 0
//
//        // Loop over array
//        for (index, n) in nums.enumerated() {
//            count += n
//            indexs = []
//            indexs.append(index)
//
//            for(innerIndex, k) in nums.enumerated().dropFirst(index + 1) {
//                count += k
//                indexs.append(innerIndex)
//
//                if(count > target) {
//                    count -= k
//                    indexs.popLast()
//                }
//
//                if(count == target) {
//                    return indexs
//                }
//            }
//
//            // reset count & indexs
//            count = 0
//            indexs = []
//        }
//
//        return indexs
//    }
//}

//let handleSolution = Solution()
//handleSolution.twoSum([7,11,1,15,1], 9)
//handleSolution.twoSum([2,7,11,15], 9)
//handleSolution.twoSum([3,2,4], 6)
//handleSolution.twoSum([3,2,3], 6)

// Solution V2

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // 1. unordered map to store lookups
        var unorderedMap = [Int: Int]()
        
        // Loop over array of nums
        for (index, value) in nums.enumerated() {
            if let addent = unorderedMap[value] {
                return [addent, index]
            } else {
                unorderedMap[target - value] = index
            }
        }
        
        return []
        
    }
}

let handleSolution = Solution()
handleSolution.twoSum([7,11,1,15,2], 9)
handleSolution.twoSum([2,7,11,15], 9)
handleSolution.twoSum([3,2,4], 6)
handleSolution.twoSum([3,2,3], 6)
