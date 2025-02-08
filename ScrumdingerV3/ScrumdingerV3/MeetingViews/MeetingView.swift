import AVFoundation
import SwiftUI

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()

    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    private var player2: AVPlayer { AVPlayer.sharedSportsPlayer }
    
    private func skipAction() -> Void {
        player2.seek(to: .zero)
        scrumTimer.skipSpeaker()
        player2.play()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaining: scrumTimer.secondsRemaining,
                    theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(
                    speakers: scrumTimer.speakers,
                    skipAction: skipAction)
            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .onAppear {
                scrumTimer.reset(
                    lengthInMinutes: scrum.lengthInMinutes,
                    attendees: scrum.attendees)
                scrumTimer.speakerChangedAction = {
                    player.seek(to: .zero)
                    player.play()
                }
                scrumTimer.startScrum()
            }
            .onDisappear {
                scrumTimer.stopScrum()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[1]))
}
