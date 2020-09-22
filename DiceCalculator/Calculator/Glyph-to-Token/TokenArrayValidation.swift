extension Array where Element == Token {
	
	/// Throws an error if the array contains unbalanced parentheses,
	/// otherwise returns the array on which this method was called.
	func validated() throws -> [Token] {
		var nestingLevel = 0
		for token in self {
			switch token {
			case .parenthesisLeft:
				nestingLevel += 1
			case .parenthesisRight:
				nestingLevel -= 1
				if nestingLevel < 0 {
					throw CalcError.missingLeftParenthesis
				}
			default: break
			}
		}
		guard nestingLevel == 0 else {
			throw CalcError.missingRightParenthesis
		}
		return self
	}
}
