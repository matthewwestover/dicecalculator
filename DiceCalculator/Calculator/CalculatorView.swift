import SwiftUI

struct CalculatorView: View {
	
	// Final result to display at top of calculator
	@State var finalValue:String = "18"
	// Max result to display at top of calculator
	@State var maxValue:String = "20"
	// Half of final result to display at top of calculator
	@State var halfValue:String = "9"
	// Expression to calculate
	@State var calExpression: [String] = []
	// Currently being input
	@State var inputExpr: String = "5 + 1d20"
	
    var body: some View {
		ZStack (alignment: .bottom){
			Color.black.edgesIgnoringSafeArea(.all)
			VStack{
				// Result of calculation
				CalcResultView(final: finalValue, maxVal: maxValue, halfVal: halfValue)
				// Input
				CalcInputView(inpExpr: inputExpr)
				Spacer()
			}
//			CalculatorButtonPad()
//				.padding(.bottom)
		}
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

struct CalcButton: View {
	
	let fontSize: CGFloat = 38
	let title: String
	let image: Image
	let size: CGSize
	let bgColor: Color
	let description: String
	
	var body: some View {
		Button(action: {print("hi")}){
			HStack {
				image.resizable()
					.foregroundColor(.white)
					.frame(width: 32.0, height: 32.0)
				Text(description)
					.font(.system(size: fontSize))
					.foregroundColor(.white)
			}
			.padding()
			.frame(width: size.width, height: size.height)
			.background(bgColor)
	}
  }
}

struct CalcButtonRow: View {
	let row: [CalcButtonItem]
	var body: some View {
		HStack {
			ForEach(row, id: \.self) { item in
				CalcButton(
				title: item.title,
				image: item.image,
				size: item.size,
				bgColor: item.bgColor,
				description: item.description)
			}
		}
	}
}

struct CalculatorButtonPad: View {
	let pad: [[CalcButtonItem]] = [
		[.command(.clear), .dice(.dPer), .dice(.dx), .command(.delete)],
		[.dice(.d4), .dice(.d6), .dice(.d8), .op(.divide)],
		[.dice(.d10), .dice(.d12), .dice(.d20), .op(.multiply)],
		[.digit(7), .digit(8), .digit(9), .op(.minus)],
		[.digit(4), .digit(5), .digit(6), .op(.plus)],
		[.digit(1), .digit(2), .digit(3)],
		[.digit(0), .op(.openPar), .op(.closePar), .op(.equal)]
	]
	
	var body: some View {
		VStack(spacing: 8) {
			ForEach(pad, id: \.self) { row in
				CalcButtonRow(row: row)
			}
		}
	}
}
