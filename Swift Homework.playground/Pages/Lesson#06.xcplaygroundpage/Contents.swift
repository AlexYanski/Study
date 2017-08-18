

var name = "Bob"
var number = 123

print(name)
print(number)

// Function

func doSome() {
    print(name)
    print(number)
}

doSome()

func inputValer(putValue: String) {
    print(putValue)
}

inputValer(putValue: "I am a function")

//--------------------

func checkAge(imputAge: Int) {
    if imputAge < 18 {
        print("You can't drink")
    } else {
        print("You may drink")
    }
}

checkAge(imputAge: 20)
checkAge(imputAge: 15)


//--------------------

func returnValue() -> String {
    return "I am a returned string"
}

var returnedValue = returnValue()
print(returnedValue)



func doNothing(imputSomething: Int) -> Int {
    return imputSomething
}

print(doNothing(imputSomething: 10))