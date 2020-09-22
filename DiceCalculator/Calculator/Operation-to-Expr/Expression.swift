indirect enum Expression: Equatable {

	// Initial value
	case empty

	// Leaf node
	case number(Number)

	// Branch nodes
	case add(Expression, Expression)
	case divide(Expression, Expression)
	case multiply(Expression, Expression)
	case subtract(Expression, Expression)
}
