import Foundation

struct Workout: Identifiable {
    enum WorkoutCategory: String, CaseIterable {
        case strength
        case cardio
        case mixed
    }

    var id: UUID = UUID()
    var name: String
    var durationInMinutes: Int
    var timeInHours: Double {
        Double(durationInMinutes) / 60
    }

    // Specialized collections
    var strengthExercises: [StrengthExercise]
    var cardioExercises: [CardioExercise]

    // Computed property to determine category based on exercises
    var category: WorkoutCategory {
        if !strengthExercises.isEmpty && !cardioExercises.isEmpty {
            return .mixed
        } else if !strengthExercises.isEmpty {
            return .strength
        } else {
            return .cardio
        }
    }
}

// MARK: Preview Data
extension Workout {
    static let sampleStrengthExercise1 = StrengthExercise(
        title: "Incline Bench Press", reps: 5, sets: 3, weightInKilograms: 100)
    static let sampleStrengthExercise2 = StrengthExercise(
        title: "Incline Dumbell Press", reps: 8, sets: 4, weightInKilograms: 35)
    static let sampleStrengthExercise3 = StrengthExercise(
        title: "Decline Machine Press", reps: 8, sets: 4, weightInKilograms: 40)

    // Adding some cardio exercises for variety
    static let sampleCardioExercise1 = CardioExercise(
        title: "Treadmill Run", durationInMinutes: 20, caloriesBurned: 200)
    static let sampleCardioExercise2 = CardioExercise(
        title: "Rowing Machine", durationInMinutes: 15, caloriesBurned: 150)
    static let sampleCardioExercise3 = CardioExercise(
        title: "Stepper Machine", durationInMinutes: 20, caloriesBurned: 300)

    static let sampleData: [Workout] = [
        Workout(
            name: "Brutal Chest",
            durationInMinutes: 100,
            strengthExercises: [
                sampleStrengthExercise1, sampleStrengthExercise2,
                sampleStrengthExercise3,
            ],
            cardioExercises: []
        ),
        Workout(
            name: "Gorilla Chest",
            durationInMinutes: 50,
            strengthExercises: [
                sampleStrengthExercise3, sampleStrengthExercise2,
                sampleStrengthExercise1,
            ],
            cardioExercises: []),
        Workout(
            name: "Bench 4 days",
            durationInMinutes: 20,
            strengthExercises: [
                sampleStrengthExercise1, sampleStrengthExercise2,
                sampleStrengthExercise3,
            ],
            cardioExercises: []),
        Workout(
            name: "Anabolic Monster",
            durationInMinutes: 35,
            strengthExercises: [
                sampleStrengthExercise2, sampleStrengthExercise1,
                sampleStrengthExercise3,
            ],
            cardioExercises: []),
        Workout(
            name: "Cardio Day",
            durationInMinutes: 45,
            strengthExercises: [],
            cardioExercises: [sampleCardioExercise1, sampleCardioExercise2]),
        Workout(
            name: "Full Body Workout",
            durationInMinutes: 60,
            strengthExercises: [
                sampleStrengthExercise1, sampleStrengthExercise3,
            ],
            cardioExercises: [sampleCardioExercise1]),
    ]

    static var emptyWorkout: Workout {
        Workout(
            name: "New Workout",
            durationInMinutes: 0,
            strengthExercises: [],
            cardioExercises: [])
    }
}
