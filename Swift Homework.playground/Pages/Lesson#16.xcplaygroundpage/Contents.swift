
// Error handling

// Ex) 1

// $1000 --> Error
// < $0 --> Error


enum SpendingError: Error {
    case minus
    case limit
}

func calculateTotalSpending(morningSpending: Double, eveningSpending: Double) throws -> Double {
    if morningSpending < 0 || eveningSpending < 0 {
        throw SpendingError.minus
    }
    
    if (morningSpending + eveningSpending) > 1000 {
        throw SpendingError.limit
    }
    
    return morningSpending + eveningSpending
}

do {
    try calculateTotalSpending(morningSpending: 300, eveningSpending: 500)
} catch SpendingError.minus {
    print("Not possible")
} catch SpendingError.limit {
    print("Reached the limit")
}