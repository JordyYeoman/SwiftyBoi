import Foundation
import SwiftUI

enum UnitKind {
    case temperature
    case distance
    case energy
    case time
    case percentage
    
    var displayUnit: String {
        switch self {
        case .distance:
            "km"
        case .temperature:
            "C"
        case .energy:
            "kCal"
        case .time:
            "hours"
        case .percentage:
            "%"
        }
    }

    var icon: Text {
        switch self {
        case .distance:
            Text("🏃‍♂️")
        case .temperature:
            Text("🌡️")
        case .energy:
            Text("🔥")
        case .time:
            Text("🛏️")
        case .percentage:
            Text("🙇")
        }
    }
}
