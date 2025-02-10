import Observation
import SwiftUI

@Observable class HomeViewModel {
    let username: String = "Jordy"
    var hasDismissedWelcomeText: Bool = false
    var isFirstLaunch: Bool = true
    var workouts = Workout.sampleData
}
