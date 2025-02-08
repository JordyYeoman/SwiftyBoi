import Foundation

protocol Exercise: Identifiable, Equatable {
    var title: String { get }
    var description: String? { get }
}

struct StrengthExercise: Exercise {
    let id: UUID = UUID()
    let title: String
    var description: String?
    var reps: Int
    var sets: Int
    var weightInKilograms: Double

    var weightInTonnes: Double {
        return weightInKilograms / 1000.0
    }
}

struct CardioExercise: Exercise {
    let id: UUID = UUID()
    let title: String
    var description: String?
    var durationInMinutes: Double
    var caloriesBurned: Int
}
