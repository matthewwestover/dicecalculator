enum Number: Equatable, CustomDebugStringConvertible, CustomStringConvertible {

	case int(Int)
	case double(Double)

	var debugDescription: String {
		switch self {
		case .int(let intValue):
			return String(intValue)
		case .double(let doubleValue):
			// Avoid printing decimal places for a whole number.
			if doubleValue.rounded() == doubleValue {
				let intValue = Int(doubleValue)
				return Number.int(intValue).debugDescription
			}
			else {
				return String(doubleValue)
			}
		}
	}
	
	var description: String{
		switch self {
		case .int(let intValue):
			return String(intValue)
		case .double(let doubleValue):
			return String(doubleValue)
		}
	}
}
