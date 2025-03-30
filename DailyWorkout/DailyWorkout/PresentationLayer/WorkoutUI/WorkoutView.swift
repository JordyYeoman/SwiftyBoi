import SwiftUI

struct WorkoutView: View {
    var workout: Workout

    @State private var editingWorkout = Workout.emptyWorkout
    @State private var isPresentingEditView = false
    @State private var settingsDent = PresentationDetent.medium

    var body: some View {
        List {
            if workout.strengthExercises.isNotEmpty {
                Section(header: Text("Strength Exercises")) {
                    ForEach(workout.strengthExercises) { strengthExercise in
                        Text(strengthExercise.title)
                    }
                }
            }

            if workout.cardioExercises.isNotEmpty {
                Section(header: Text("Cardio Exercises")) {
                    ForEach(workout.cardioExercises) { cardioExercise in
                        Text(cardioExercise.title)
                    }
                }
            }
        }
        .navigationTitle(workout.name)
        .toolbar {
            Button("Edit") {
                print("Editing")
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: Workout.sampleData[0])
    }
}
