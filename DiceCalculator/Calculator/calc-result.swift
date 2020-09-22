enum CalcResult<Value: Equatable>: Equatable {

	case value(Value)
	case error(CalcError)

	func then<NextValue>(_ produceNextResult: (Value) -> CalcResult<NextValue>) -> CalcResult<NextValue> {
		switch self {
		case .value(let value): return produceNextResult(value)
		case .error(let error): return .error(error)
		}
	}
	
}
