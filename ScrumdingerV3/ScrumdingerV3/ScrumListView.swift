import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .navigationTitle("Daily Scrums")

            NavigationLink(destination: WalletInputViewList()) {
                Text("Go to wallet view")
            }
            .navigationTitle("Wallet View")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData))
    }
}
