import SwiftUI

struct WelcomeBubbleView: View {
    @State var viewModel = WelcomeBubbleViewModel()
    
    var body: some View {
        if !viewModel.hasDismissedWelcomeText {
            HStack {
                Text(
                    "Welcome \(viewModel.isFirstLaunch ? "" : "back,") \(viewModel.username)"
                )
                .onAppear {
                    viewModel.isFirstLaunch = false
                }
                .font(.title2)
                .fontWeight(.medium)
                .padding()
                .foregroundStyle(Color.retroDarkPurple)
                Spacer()
                Button {
                    viewModel.hasDismissedWelcomeText.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 12, height: 12)
                }
                .padding(.trailing, 24)
                .foregroundStyle(Color.retroDarkPurple)
            }
            .padding(.horizontal, 12)
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}
