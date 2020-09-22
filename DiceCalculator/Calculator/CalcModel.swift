import Foundation

class CalcModel: ObservableObject {
	
	@Published var finalValue = ""
	@Published var maxValue = "" // value if dice was max value
	@Published var halfValue = "" // gets from real roll
	@Published var inputExpr = "" // displays on CalcInputView
	@Published var inputClean = "" // displays on CalcResultView
	@Published var maxExpr = ""
	@Published var cleanArr:[String] = [] // array for after rolling dice
	@Published var maxArr:[String] = [] // maxvalue
	@Published var inputArr:[String] = [] // adds items from input
	
	//Takes the array of inputs and converts to a single string for display
	func flattenTheExpression(exps: [String]) -> String {
		var calExp = ""
		for exp in exps {
			calExp.append(exp)
		}
		return calExp
	}
	
	// Takes incoming value and adds to array. Flattens to a string
	// If last thing added was a dice, and the next number gets added
	// dX however sticks the dice size to it
	func receiveInput(value: String) {
		let last = self.inputArr.last
		if(last?.isNumeric == false && last?.isOp == false){
			let isDice = last?.contains("d")
			if(isDice == false){
				let input = "+"
				self.inputArr.append(input)
			}
		}
		if(last?.isNumeric == true && value.isOp == false){
			let newNum = last! + value
			let _ = self.inputArr.removeLast()
			self.inputArr.append(newNum)
			self.inputExpr = self.flattenTheExpression(exps: inputArr)
		} else {
			self.inputArr.append(value)
			self.inputExpr = self.flattenTheExpression(exps: inputArr)
		}
	}
	
	func clearInput() {
		self.inputArr = []
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
		self.finalValue = ""
		self.maxValue = ""
		self.halfValue = ""
		self.inputClean = ""
		self.cleanArr = []
		self.maxArr = []
	}
	
	func backspace() {
		if(inputArr.count == 0){
			self.inputArr = [];
		} else {
			_ = self.inputArr.removeLast()
		}
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
		
	}
	
	func addDice(value: String){
		let last = self.inputArr.last
		if(last?.isNumeric == false && last?.isOp == false) {
			let input = "+"
			self.inputArr.append(input)
		}
		if(last?.isNumeric == false || last?.isNumeric == nil) {
			let input = "1" + value
			self.inputArr.append(input)
		} else if(last?.isNumeric == true) {
			let newDice = last! + value
			_ = self.inputArr.removeLast()
			self.inputArr.append(newDice)
		} else {
			self.inputArr.append(value)
		}
		self.inputExpr = self.flattenTheExpression(exps: inputArr)
	}
	
	func calculate(){
		self.getDice()
		let rolled = InputParser.createGlyphs(from: self.inputClean)
			.then(Tokenizer.createTokens(fromGlyphs:))
			.then(Operationizer.createOperations(fromTokens:))
			.then(Expressionizer.createExpression(fromOperations:))
			.then(Calculator.evaluate(expression:))
		switch rolled {
		case .value(let number): self.finalValue = number.description
		case .error(let error): print(error.message)
		}
		
	}
	
	func getDice(){
		self.cleanArr = self.inputArr
		for (index, item) in self.cleanArr.enumerated() {
			let isDice = item.contains("d")
			if(isDice == true){
				self.cleanArr[index] = self.rollDice(value: item)
			}
		}
		self.inputClean = self.flattenTheExpression(exps: cleanArr)
		self.maxArr = self.inputArr
		for (index, item) in self.maxArr.enumerated() {
			let isDice = item.contains("d")
			if(isDice == true){
				self.maxArr[index] = self.maxDice(value: item)
			}
		}
		self.maxExpr = self.flattenTheExpression(exps: maxArr)
	}
	
	func rollDice(value: String) -> String {
		var finalVal = "("
		let arr = value.components(separatedBy: "d")
		guard arr.count > 0 else { return "InvalidDice" }
		let totalDice = Int(arr[0])!
		let diceSize = Int(arr[1])!
		var randArr:[String] = []
		for _ in 0..<totalDice {
			let number = String(Int.random(in: 1...diceSize))
			randArr.append(number)
		}
		finalVal += randArr.joined(separator: "+") + ")"
		return finalVal
	}
	
	func maxDice(value: String) -> String {
		let arr = value.components(separatedBy: "d")
		guard arr.count > 0 else { return "InvalidDice" }
		let totalDice = Int(arr[0])!
		let diceSize = Int(arr[1])!
		var randArr:[String] = []
		for _ in 0..<totalDice {
			randArr.append(String(diceSize))
		}
		return randArr.joined(separator: "+")
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
