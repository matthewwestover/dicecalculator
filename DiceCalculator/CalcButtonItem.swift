import Foundation
import SwiftUI

enum CalcButtonItem {
	enum Op: String {
		case plus = "+"
		case minus = "-"
		case multiply = "×"
		case divide = "÷"
		case equal = ""
		case openPar = "("
		case closePar = ")"
	}
	
	enum Command: String {
		case clear = "AC"
		case delete = ""
	}
	
	enum Dice: String {
		case d4 = "d4"
		case d6 = "d6"
		case d8 = "d8"
		case d10 = "d10"
		case d12 = "d12"
		case d20 = "d20"
		case dPer = "d%"
		case dx = "dx"
	}
	
	case digit(Int)
	case op(Op)
	case command(Command)
	case dice(Dice)
}

extension CalcButtonItem {
	var title: String {
		switch self {
		case .digit(let value):
			return String(value)
		case .op(let op):
			return op.rawValue
		case .command(let command):
			return command.rawValue
		case .dice(let dice):
			return dice.rawValue
		}
	}
	
	var image: Image {
		switch self {
		case .op(.equal):
			return Image("DiceRoll")
		case .command(.delete):
			return Image(systemName: "delete.left.fill")
		default: return Image("")
		}
	}
	
	var size: CGSize {
		if case .digit(let value) = self, value == 0 {
			return CGSize(width: 88 * 2 + 8, height: 88)
		}
		return CGSize(width: 88, height: 88)
	}
}

extension CalcButtonItem: Hashable {}

extension CalcButtonItem: CustomStringConvertible {
	var description: String {
		switch self {
		case .digit(let num): return String(num)
		case .op(let op): return op.rawValue
		case .command(let command): return command.rawValue
		case .dice(let dice): return dice.rawValue
		}
	}
}
