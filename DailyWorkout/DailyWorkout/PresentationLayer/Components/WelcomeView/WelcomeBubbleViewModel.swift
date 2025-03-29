import Observation
import SwiftUI

@Observable class WelcomeBubbleViewModel {
    let username: String = "Jordy"
    var hasDismissedWelcomeText: Bool = false
    var isFirstLaunch: Bool = true
}
