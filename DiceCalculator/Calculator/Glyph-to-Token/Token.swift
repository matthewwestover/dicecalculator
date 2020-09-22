enum Token: Equatable, CustomStringConvertible {
	case add
	case divide
	case multiply
	case number(Number)
	case parenthesisLeft(negated: Bool)
	case parenthesisRight
	case subtract
	
	var description: String {
		switch self {
		case .add: return ".add"
		case .divide: return ".divide"
		case .multiply: return ".multiply"
		case .number(let Number): return Number.description
		case .parenthesisLeft: return ".leftPar"
		case .parenthesisRight: return ".rightPar"
		case .subtract: return ".minus"
		}
	}
}
