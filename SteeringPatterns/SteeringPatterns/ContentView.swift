import SwiftUI

struct ListView: View {
    var body: some View {
        HStack {
            Image("gigachad")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .cornerRadius(4)
            Text("Big Dog")
                .fontWeight(.bold)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
