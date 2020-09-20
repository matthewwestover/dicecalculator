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
		default: return ""
		}
	}
	
	var image: Image {
		switch self {
		case .op(.equal):
			return Image("DiceRoll")
		case .command(.delete):
			return Image(systemName: "delete.left.fill")
		case .dice(.d4):
			return Image("D4")
		case .dice(.d6):
			return Image("D6")
		case .dice(.d8):
			return Image("D8")
		case .dice(.d10):
			return Image("D10")
		case .dice(.d12):
			return Image("D12")
		case .dice(.d20):
			return Image("D20")
		case .dice(.dPer):
			return Image("DPer")
		case .dice(.dx):
			return Image("Dice")
		default: return Image("")
		}
	}
	
	var size: CGSize {
		return CGSize(width: 88, height: 88)
	}
	
	var bgColor: Color {
		switch self {
		case .digit:
			return Color.rogue
		case .op:
			return Color.wizard
		case .command:
			return Color.sorcerer
		case .dice:
			return Color.warlock
		}
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
