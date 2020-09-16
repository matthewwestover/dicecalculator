import SwiftUI

struct ContentView: View {
	
	// Final result to display at top of calculator
	@State var finalValue:String = "Dice Roller"
	
	// Expression to calculate
	@State var calExpression: [String] = []
	
	// Currently being input
	@State var noBeingEntered: String = ""
	
	let rows = [
		["7", "8", "9", "÷"],
		["4", "5", "6", "×"],
		["1", "2", "3", "−"],
		[".", "0", "=", "+"]
	]
	
	var body: some View {
		VStack {
			VStack {
				// Result
				Text(self.finalValue)
					.font(Font.custom("HelveticaNeue-thin", size: 60))
					.frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
					.foregroundColor(Color.white)
				
				// User Input
				Text(flattenTheExpression(exps: calExpression))
					.font(Font.custom("HelveticaNeue-Thin", size: 24))
					.frame(alignment: Alignment.bottomTrailing)
					.foregroundColor(Color.white)
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
			.background(Color.wizard)
			VStack {
				Spacer(minLength: 48)
				VStack {
					ForEach(rows, id: \.self) { row in
						HStack(alignment: .top, spacing: 0) {
							Spacer(minLength: 13)
							ForEach(row, id: \.self) { column in
								Button(action: {
									if column == "=" {
										self.calExpression = []
										self.noBeingEntered = ""
										return
									} else if checkIfOperator(str: column)  {
										self.calExpression.append(column)
										self.noBeingEntered = ""
									} else {
										self.noBeingEntered.append(column)
										if self.calExpression.count == 0 {
											self.calExpression.append(self.noBeingEntered)
										} else {
											if !checkIfOperator(str: self.calExpression[self.calExpression.count-1]) {
												self.calExpression.remove(at: self.calExpression.count-1)
											}
											
											self.calExpression.append(self.noBeingEntered)
										}
									}
									
									self.finalValue = processExpression(exp: self.calExpression)
									
									if self.calExpression.count > 3 {
										self.calExpression = [self.finalValue, self.calExpression[self.calExpression.count - 1]]
									}
									
								}, label: {
									Text(column)
										.font(.system(size: getFontSize(btnTxt: column)))
										.frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
								})
									.foregroundColor(Color.white)
									.background(getBackground(str: column))
							}
						}
					}
				}
			}
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 500, maxHeight: .infinity, alignment: .topLeading)
			.background(Color.black)
		}
		.edgesIgnoringSafeArea(.all)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

// Takes components of the expression to calcuate and converts to a single string
func flattenTheExpression(exps: [String]) -> String {
	var calExp = ""
	for exp in exps {
		calExp.append(exp)
	}
	return calExp
}

// Return differnt font sizes for operators and numbers.
func getBackground(str:String) -> Color {
	if checkIfOperator(str: str) {
		return Color.wizard
	}
	return Color.black
}

// Return differnt font sizes for operators and numbers.
func getFontSize(btnTxt: String) -> CGFloat {
	if checkIfOperator(str: btnTxt) {
		return 42
	}
	return 24
}

// This function returns if the passed argument is a operator or not.
func checkIfOperator(str:String) -> Bool {
	if str == "÷" || str == "×" || str == "−" || str == "+" || str == "=" {
		return true
	}
	return false
}

func processExpression(exp:[String]) -> String {
	if exp.count < 3 {
		return "0.0"
	}
	
	var a = Double(exp[0])
	var c = Double("0.0")
	let expSize = exp.count
	
	for i in (1...expSize-2) {
		
		c = Double(exp[i+1])
		
		switch exp[i] {
		case "+":
			a! += c!
		case "−":
			a! -= c!
		case "×":
			a! *= c!
		case "÷":
			a! /= c!
		default:
			print("skipping the rest")
		}
	}
	return String(format: "%.1f", a!)
}
