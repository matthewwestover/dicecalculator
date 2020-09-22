indirect enum Operation: Equatable {
	
	case binaryOperator(BinaryOperator)
	enum BinaryOperator: Equatable {
		case add, divide, multiply, subtract
	}
	
	case operand(Operand)
	enum Operand: Equatable {
		case number(Number)
		case parenthesizedOperations([Operation], negated: Bool)
	}
}

