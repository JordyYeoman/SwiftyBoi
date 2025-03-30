import Foundation

// Base protocol
protocol Exercise: Identifiable, Hashable {
    var id: UUID { get }
    var title: String { get }
    var description: String? { get }
}

// Concrete implementations
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

