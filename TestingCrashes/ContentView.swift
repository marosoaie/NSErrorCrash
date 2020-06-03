import SwiftUI
import ReactiveSwift

struct ContentView: View {
    var body: some View {
        Button(action: {
            let viewModel = ViewModel()
            viewModel.activate()
        }) {
            Text("Press me")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
