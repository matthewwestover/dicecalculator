import SwiftUI

struct CalculatorView: View {
    var body: some View {
		ZStack (alignment: .bottom){
			Color.black.edgesIgnoringSafeArea(.all)
			Text("Hello")
				.foregroundColor(Color.wizard)
		}
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
