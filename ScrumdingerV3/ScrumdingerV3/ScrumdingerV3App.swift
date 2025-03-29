import SwiftUI

@main
struct ScrumdingerV3App: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            Stackz()
            ScrumsView(scrums: $scrums)
        }
    }
}
