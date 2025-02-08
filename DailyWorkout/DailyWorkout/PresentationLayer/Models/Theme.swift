import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case retroAqua
    case retroBackgroundPrimary
    case retroDarkPurple
    case retroLightPurple
    case retroOrange
    case retroPink
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
