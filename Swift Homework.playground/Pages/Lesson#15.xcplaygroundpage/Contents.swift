
// Generic

// Ex

var stringArray = ["Hi", "Hello", "Bye"]
var intArray = [1, 2, 3, 4, 5]
var doubleArray = [1.2, 3.1, 2.2]

// Print All the element

func printStringFromArray(a: [String]) {
    for s in a {
        print(s)
    }
}

func printIntFromArray(a: [Int]) {
    for i in a {
        print(i)
    }
}

func printDoubleFromArray(a: [Double]) {
    for d in a {
        print(d)
    }
}

printStringFromArray(a: stringArray)
printDoubleFromArray(a: doubleArray)
printIntFromArray(a: intArray)

// Generic Kicks in

// Ex 1)

func printElementFromArray<T>(a: [T]) {
    for element in a {
        print(element)
    }
}

printElementFromArray(a: stringArray)
printElementFromArray(a: doubleArray)
printElementFromArray(a: intArray)



// Ex 2)

func doNothing<T>(x: T) -> T {
    return x
}

doNothing(x: "123")
doNothing(x: 123)
doNothing(x: 12.123)


// Ex 3)

struct GenericArray<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
}

var myFriendsList = ["Dima", "Ivan", "Petya"]
var array = GenericArray(items: myFriendsList)

array.push(item: "Max")
array.items




