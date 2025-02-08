import SwiftUI

struct AddExerciseView: View {
    var body: some View {
        HStack{
            Label("Exercise", systemImage: "weight.fill")
        }
        .backgroundStyle(.red)
    }
}

#Preview {
    AddExerciseView()
}
