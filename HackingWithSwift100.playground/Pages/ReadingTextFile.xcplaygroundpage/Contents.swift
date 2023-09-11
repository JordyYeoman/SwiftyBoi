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
