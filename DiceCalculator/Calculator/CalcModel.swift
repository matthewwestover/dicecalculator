import Foundation

class CalcModel: ObservableObject {
	
	@Published var finalValue = ""
	@Published var maxValue = ""
	@Published var halfValue = ""
	@Published var inputExpr = ""
	@Published var inputClean = ""
	@Published var inputArr:[String] = []
	
	func flattenTheExpression(exps: [String]) -> String {
		var calExp = ""
		for exp in exps {
			calExp.append(exp)
		}
		return calExp
	}
	
	func receiveInput(value: String) {
		let last = self.inputArr.last
		if(last?.isNumeric == false && last?.isOp == false){
			let input = "+"
			self.inputArr.append(input)
		}
		self.inputArr.append(value)
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
	}
	
	func clearInput() {
		self.inputArr = []
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
	}
	
	func backspace() {
		_ = self.inputArr.removeLast()
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
	}
	
	func addDice(value: String){
		let last = self.inputArr.last
		if(last?.isNumeric == false || last?.isNumeric == nil) {
			let input = "1" + value
			self.inputArr.append(input)
		} else {
			self.inputArr.append(value)
		}
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
	}
}

extension String {
	var isNumeric: Bool {
		guard self.count > 0 else { return false }
		let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
		return Set(self).isSubset(of: nums)
	}
	
	var isOp: Bool {
		guard self.count > 0 else { return false }
		let ops: Set<Character> = ["/", "x", "-", "+", "(" , ")"]
		return Set(self).isSubset(of: ops)
	}
}
