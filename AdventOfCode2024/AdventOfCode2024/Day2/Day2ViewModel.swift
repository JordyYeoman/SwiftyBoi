//
//  Day1ViewModel.swift
//  AdventOfCode2024
//
//  Created by Jordy Yeoman on 2/12/2024.
//

import Foundation

func isSafeVariance(x: Int, y: Int) -> Bool {
    if abs(x - y) > 3 {
        return false
    }
    
    if abs(x - y) < 1 {
        return false
    }
    
    return true
}

func moAbstraction(split: [String.SubSequence]) -> (Bool, Int) {
    var isSafu = false
    var isIncreasing = false
    var failIndex = 0
    
    // Loop over each and check the previous number
    for (index, n) in split.enumerated() {
        if index == 0 {
            continue
        }
        
        let prevNum = Int(split[index - 1])
        let currNum = Int(n)
        
        if (currNum == nil) || (prevNum == nil) {
            continue
        }
        
        // Check on first valid comparison if we should be increasing or decreasing
        if currNum! > prevNum! && index == 1 {
            isIncreasing = true
        }
        
        print("Is safe: \(isSafeVariance(x: prevNum!, y: currNum!))")
        
        if(isSafeVariance(x: prevNum!, y: currNum!)) {
            isSafu = true
        } else {
            isSafu = false
            failIndex = index
            break
        }
        
        // Check if increasing
        if isIncreasing {
            isSafu = currNum! > prevNum!
        } else {
            // Decreasing
            isSafu = prevNum! > currNum!
        }
        
        if(!isSafu) {
            failIndex = index
            break
        }
    }
    
    return (isSafu, failIndex)
}

func isSafeLine(ln: String) -> Bool {
    var split = ln.split(separator: " ")
    if(split.isEmpty) {
        return false
    }
    var sIsSafu = false
    
    // For part 2
    let (isSafu, index) = moAbstraction(split: split)
    
    // 382
    if(!isSafu) {
        // Delete the failed index
        split.remove(at: index)
        (sIsSafu, _) = moAbstraction(split: split)
    } else {
        return true
    }
    
    return sIsSafu
}

func solveDay2() {
    print("Day 2 Running.")
    
    let res = readTextFile(fileName: "day2")
    let allLines = res.components(separatedBy: .newlines)
    
    var totalSafeReports = 0
    
    // Loop over each line, check if it is SAFE
    for (index, line) in allLines.enumerated() {
        let x = isSafeLine(ln: line)
        print("line: \(index), isSafeLine: \(x), \nLine: \(line)")
        
        // Can be increasing or decreasing by a max of 3
        if x {
            totalSafeReports += 1
        }
    }
    
    print("Total Safe Reports: \(totalSafeReports)")
}
