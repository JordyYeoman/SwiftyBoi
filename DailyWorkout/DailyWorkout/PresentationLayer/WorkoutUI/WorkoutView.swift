import SwiftUI

struct WorkoutView: View {
    @Binding var workout: Workout

    @State private var editingWorkout = Workout.emptyWorkout
    @State private var isPresentingEditView = false
    @State private var settingsDent = PresentationDetent.medium

    var body: some View {
        List {
            Section(header: Text("Exercises")) {
                Text("Sup")
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
        WorkoutView(workout: .constant(Workout.sampleData[0]))
    }
}
