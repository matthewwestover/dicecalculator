import Foundation

class CalcModel: ObservableObject {
	
	@Published var finalValue = ""
	@Published var maxValue = ""
	@Published var halfValue = ""
	@Published var inputExpr = "1d20"
	@Published var inputClean = ""
	
//	func receiveInput(value: String) {
//		self.inputExpr = self.inputExpr + value
//	}
	
}
