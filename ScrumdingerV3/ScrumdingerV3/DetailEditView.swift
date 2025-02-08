import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum
    @State private var newAttendeeName = ""
    
    @State var shouldShake: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(
                        value: $scrum.lengthInMinutesAsDouble, in: 5...30,
                        step: 1
                    ) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) mins")
                        .frame(minWidth: 65, alignment: .trailing)
                }
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                .onChange(of: scrum.attendees) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isFocused = true
                    }
                }
                
                NewAttendeeInputView(newAttendeeName: $newAttendeeName, scrum: $scrum, isFocused: $isFocused)
            }
            
        }
    }
}

struct NewAttendeeInputView: View {
    @Binding var newAttendeeName: String
    @Binding var scrum: DailyScrum
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField("New Attendee", text: $newAttendeeName)
                .focused($isFocused)
            Button(action: {
                let attendee = DailyScrum.Attendee(
                    name: newAttendeeName)
                scrum.attendees.append(attendee)
                newAttendeeName = ""
            }
            ) {
                Image(systemName: "plus.circle.fill")
                    .accessibilityLabel("Add attendee")
            }
            .disabled(newAttendeeName.isEmpty)
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
