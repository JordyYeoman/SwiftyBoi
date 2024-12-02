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
        print("(Int(leftEl) \(String(describing: Int(leftEl)))")
        print("rightList[index] \(rightList[index])")

        totalDistance += abs((Int(leftEl) ?? 0) - (Int(rightList[index]) ?? 0))
    }
    
    print("Total Distance: \(totalDistance)")
}
