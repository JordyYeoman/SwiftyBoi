import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum

    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    @State private var settingsDetent = PresentationDetent.medium

    var testStr1 = "helloWorld"
    var testStr2 = "hellodudeWorld"
    var testStr3 = "hellodudeWorld".uuidString
    var base64 = #"\306\2661J\037\361K\321\220\230h\370\352\006e\020"#

    var date = Date.now.formatted(.dateTime.day().month().year())

    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            Text("Whats up homie")
            Text("Yooooooo")
            Text("Hello Jordy")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Hello, World! asdfkljasdflkasjdflaksdjflaskdjflaksdsdf")
                .multilineTextAlignment(.leading)
                .background(Color.purple)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.teal)
        }
        .padding(.horizontal, 16.0)
        .padding(.top, 8.0)
        .background(Color.gray)

        List {
            Text("Date: \(date)")
            Text(testStr1)
            Text(testStr2)
            if let str = testStr3 {
                Text(str)
            }
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
                Section(header: Text("Attendees")) {
                    ForEach(scrum.attendees) { attendee in
                        Label(attendee.name, systemImage: "person")
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
            .presentationDetents(
                [.medium, .large],
                selection: $settingsDetent
            )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
