import SwiftUI

struct AppBarView: View {
    @State var presentSideMenu: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "text.justify.left")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                Spacer()
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
            .padding()
            .foregroundStyle(.white)
        }
        .background(.retroDarkPurple)
    }
}
