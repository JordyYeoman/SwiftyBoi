//
//  Day1ViewModel.swift
//  AdventOfCode2024
//
//  Created by Jordy Yeoman on 2/12/2024.
//

import Foundation

func solve() {
    print("Day 1 Running.")

    let res = readTextFile(fileName: "day1")
    let allLines = res.components(separatedBy: .newlines)
    
    var leftList: [String] = []
    var rightList: [String] = []
    
    for line in allLines {
        let split = line.split(separator: "   ")
        if(split.isEmpty) {
            break
        }
        
        leftList.append(String(split[0])) // add left number
        rightList.append(String(split[1])) // add right number
    }
    
    var totalDistance = 0
    
    // Sort each list
    leftList.sort()
    rightList.sort()
    
    // Loop over each item in left array and get the difference between the equivalent element in the right arr.
    for (index, leftEl) in leftList.enumerated() {
        totalDistance += abs((Int(leftEl) ?? 0) - (Int(rightList[index]) ?? 0))
    }
    
    print("Total Distance: \(totalDistance)")
    
    // Part 2
    // Number of occurences
    var numberOfOccurences: [String: Int] = [:]
    var similarityScore = 0
    
    for leftEl in leftList {
        for rightEl in rightList {
            if leftEl == rightEl {
                if numberOfOccurences[leftEl] == nil {
                    numberOfOccurences[leftEl] = 0
                }
                numberOfOccurences[leftEl]! += 1
            }
        }
    }
    
    // Tally up using our dictionary
    for (key, value) in numberOfOccurences {
        similarityScore += (Int(key) ?? 0) * value
    }
    
    print("Number of occurences: \(numberOfOccurences)")
    print("Similarity Score: \(similarityScore)")
}
