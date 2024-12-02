//
//  GridpointModel.swift
//  Landmarks
//
//  Created by Jordy Yeoman on 26/11/2024.
//

import Foundation

// From apple docs - https://developer.apple.com/documentation/swift/hashable
struct GridPoint {
    var x: Int
    var y: Int
}

// We want to create sets / dictionaries of Gridpoints - so the struct must conform to the
// hashable protocol
extension GridPoint: Hashable {
    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }


    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
