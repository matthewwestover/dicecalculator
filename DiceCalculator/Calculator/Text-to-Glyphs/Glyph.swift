enum Glyph: Equatable, CustomDebugStringConvertible, CustomStringConvertible {
	case add
	case decimalSeparator
	case digit(UnicodeScalar)
	case divide
	case multiply
	case parenthesisLeft
	case parenthesisRight
	case subtractOrNegate
	case whitespace

	var debugDescription: String {
		switch self {
		case .add: return "+"
		case .decimalSeparator: return "."
		case .digit(let scalar): return String(scalar)
		case .divide: return "/"
		case .multiply: return "*"
		case .parenthesisLeft: return "("
		case .parenthesisRight: return ")"
		case .subtractOrNegate: return "-"
		case .whitespace: return " "
		}
	}
	
	var description: String {
		switch self {
		case .add: return "+"
		case .decimalSeparator: return "."
		case .digit(let scalar): return String(scalar)
		case .divide: return "/"
		case .multiply: return "*"
		case .parenthesisLeft: return "("
		case .parenthesisRight: return ")"
		case .subtractOrNegate: return "-"
		case .whitespace: return " "
		}
	}
}
