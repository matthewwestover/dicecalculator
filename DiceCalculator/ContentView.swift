import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			VStack {
				Spacer()
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.background(Color.wizard)
			VStack {
				Spacer()
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 500, maxHeight: .infinity, alignment: .topLeading)
			.background(Color.rogue)
		}
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
