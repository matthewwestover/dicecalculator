import SwiftUI

struct CalculatorView: View {
	
	// Final result to display at top of calculator
	@State var finalValue:String = "18"
	// Max result to display at top of calculator
	@State var maxValue:String = "20"
	// Half of final result to display at top of calculator
	@State var halfValue:String = "9"
	// Expression to calculate
	@State var calExpression:[String] = []
	// Currently being input
	@State var inputExpr:String = "5 + 1d20"
	// Input with dice rolled
	@State var inputClean:String = "5 + (13)"
	
    var body: some View {
		ZStack (alignment: .bottom){
			Color.black.edgesIgnoringSafeArea(.all)
			VStack{
				// Result of calculation
				CalcResultView(final: finalValue, maxVal: maxValue, halfVal: halfValue, incoming: inputClean)
				// Input
				CalcInputView(inpExpr: inputExpr)
				Spacer()
				CalcPadView()
			}
		}
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
