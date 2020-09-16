import SwiftUI

struct Calculator: View {
    var body: some View {
		ZStack (alignment: .bottom){
			Color.black.edgesIgnoringSafeArea(.all)
			Text("Hello")
				.foregroundColor(Color.wizard)
		}
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator()
    }
}
