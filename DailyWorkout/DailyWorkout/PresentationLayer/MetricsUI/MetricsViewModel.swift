import Observation
import SwiftUI

@Observable class MetricsViewModel {
    // TODO: Get from health kit
    var caloriesBurnt: Int = 643
    var avgHeartRate: Int = 72
    var totalSteps: Int = 12345
}
