import SwiftUI

struct CalculatorView: View {
	
	@EnvironmentObject var model: CalcModel
	
    var body: some View {
		ZStack (alignment: .bottom){
			Color.black.edgesIgnoringSafeArea(.all)
			VStack (spacing: 0){
				// Result of calculation
				CalcResultView()
				// Input
				CalcInputView()
				CalcPadView()
			}
		}
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
		CalculatorView().environmentObject(CalcModel())
    }
}
