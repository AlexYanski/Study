

func sum(x: Int, y: Int) -> Int {
    return x + y
}


var result = sum(x: 5, y: 6)
print(result)

// Make it shorter (closure)

// closure has no func keyword and no name

var sumUsingClosure: (Int,Int) -> (Int) = { x, y in
    return x + y
}

var sumUsingShortClosure: (Int, Int) -> (Int) = {
    return $0 + $1
}
sumUsingShortClosure(5, 10)


sumUsingClosure(6, 11)


// new ex

func hello() -> String {
    return "Hello"
}
//Closure

var helloWithClosure: () -> String = {
    return "Hello (closure)"
}

helloWithClosure()