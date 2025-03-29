import SwiftUI

struct CardView: View {
    let title: String
    let metric: String
    let unit: UnitKind

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .padding(.trailing, 16)
                    .font(.callout)
                Spacer()
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color.gray.opacity(0.1))
                    unit.icon
                }
            }
            .padding(.bottom, 28)
            
            HStack(alignment: .bottom) {
                Text(metric)
                    .font(.largeTitle)
                Text(unit.displayUnit)
                    .font(.title)
                    .foregroundStyle(Color.gray)
            }
        }
        .padding(12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .frame(maxHeight: 150)
        .clipped()
        .shadow(
            color: Color.black.opacity(0.1),
            radius: CGFloat(10),
            x: CGFloat(2), y: CGFloat(2))
    }
}

#Preview {
    CardView(title: "Calories Burnt", metric: "1400", unit: .energy)
        .frame(maxWidth: 200)
}
