import Foundation

struct Workout: Identifiable {
    enum WorkoutCategory: String, CaseIterable {
        case strength
        case cardio
    }

    var id: UUID = UUID()
    var name: String
    var exercises: [any Exercise]
    var durationInMinutes: Int
    var category: WorkoutCategory
    var timeInHours: Double {
        Double(durationInMinutes) / 60
    }
}

// MARK: Preview Data
extension Workout {
    static let sampleExercise1 = StrengthExercise(
        title: "Incline Bench Press", reps: 5, sets: 3, weightInKilograms: 100)
    static let sampleExercise2 = StrengthExercise(
        title: "Incline Dumbell Press", reps: 8, sets: 4, weightInKilograms: 35)
    static let sampleExercise3 = StrengthExercise(
        title: "Decline Machine Press", reps: 8, sets: 4, weightInKilograms: 40)
    static let sampleData: [Workout] = [
        Workout(
            name: "Brutal Chest",
            exercises: [sampleExercise1, sampleExercise2, sampleExercise3],
            durationInMinutes: 100, category: .strength),
        Workout(
            name: "Gorilla Chest",
            exercises: [sampleExercise3, sampleExercise2, sampleExercise1],
            durationInMinutes: 50, category: .strength),
        Workout(
            name: "Bench 4 days",
            exercises: [sampleExercise1, sampleExercise2, sampleExercise3],
            durationInMinutes: 20, category: .strength),
        Workout(
            name: "Anabolic Monster",
            exercises: [sampleExercise2, sampleExercise1, sampleExercise3],
            durationInMinutes: 35, category: .strength),
        Workout(
            name: "Juiiiccyyyyy",
            exercises: [sampleExercise3, sampleExercise1, sampleExercise3],
            durationInMinutes: 35, category: .strength),
        Workout(
            name: "Big Poppa",
            exercises: [sampleExercise3, sampleExercise3, sampleExercise2],
            durationInMinutes: 35, category: .strength),
    ]
    
    static var emptyWorkout: Workout {
        Workout(name: "New Workout", exercises: [], durationInMinutes: 0, category: .strength)
    }
}
