import SwiftUI

struct MetricsView: View {
    @State var viewModel = MetricsViewModel()
    let cornerRadii = 32.0

    var body: some View {
        ZStack {
            // MARK Orange Background View
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.retroOrange, Color.retroPink,
                                Color.retroOrange,
                            ]
                        ),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadii))
                .overlay {
                    RoundedRectangle(cornerRadius: cornerRadii)
                        .strokeBorder(.opacity(0), lineWidth: 2)
                }

            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.retroDarkPurple,
                                Color.retroBackgroundPrimary,
                            ]
                        ),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadii))
                .overlay {
                    RoundedRectangle(cornerRadius: cornerRadii)
                        .strokeBorder(.opacity(0), lineWidth: 2)
                }
                .padding(12)

            VStack(alignment: .center) {
                HStack {
                    Text("\(viewModel.caloriesBurnt) cals")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Spacer()
                    Button {
                        viewModel.caloriesBurnt = 0
                    } label: {
                        HStack {
                            Text(viewModel.avgHeartRate.description)
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .symbolEffect(
                                    .bounce,
                                    options: .repeat(.periodic(3, delay: 2)))
                        }
                        .font(.caption)
                        .fontWeight(.medium)
                    }
                }
                .padding(.horizontal, 12)

                HStack {
                    Text("\(viewModel.totalSteps) steps")
                        .font(.footnote)
                        .fontWeight(.black)
                    Spacer()
                    Button {
                        viewModel.caloriesBurnt = 0
                    } label: {
                        HStack {
                            Text("Reset")
                                .font(.caption2)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 8, height: 8)
                        }
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color.retroPink.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadii))
                    }
                }
                .padding(.horizontal, 12)
            }
            .padding()
            .foregroundStyle(.white)
        }
        .frame(maxWidth: 300, maxHeight: 250, alignment: .center)
    }
}

#Preview {
    MetricsView()
        .padding()
}
