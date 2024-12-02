//
//  readJson.swift
//  AdventOfCode2024
//
//  Created by Jordy Yeoman on 2/12/2024.
//
import Foundation

class JSONFileReader {
    static func readJSONFile<T: Codable>(fileName: String, fileExtension: String = "json") -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            print("Error reading JSON file: \(error)")
            return nil
        }
    }
    
    // Array version
    static func readJSONArrayFile<T: Codable>(fileName: String, fileExtension: String = "json") -> [T]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([T].self, from: data)
            return jsonData
        } catch {
            print("Error reading JSON file: \(error)")
            return nil
        }
    }
}

func readTextFile(fileName: String) -> String {
    if let path = Bundle.main.path(forResource: fileName, ofType: "txt"){
        do {
            let data = try String(contentsOfFile: path, encoding: .utf8)
            return data
//            let myStrings = data.components(separatedBy: .newlines)
//            let text = myStrings.joined(separator: "\n")
//
        } catch {
            print(error)
        }
    }
        return ""
}

/// Read text file line by line in efficient way
public class LineReader {
    public let path: String
    
    fileprivate let file: UnsafeMutablePointer<FILE>!
    
    init?(path: String) {
        self.path = path
        file = fopen(path, "r")
        guard file != nil else { return nil }
    }
    
    public var nextLine: String? {
        var line: UnsafeMutablePointer<CChar>?
        var linecap: Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }
    
    deinit {
        fclose(file)
    }
}

extension LineReader: Sequence {
    public func makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}
