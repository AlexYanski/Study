
// Optionals

var newVar = 123



var myInFo = ["Name":"Alex", "Race":"Europian"]
myInFo["Name"]

myInFo["Image"]

// -----

// Normal String
var myName = "Alex"

//Optional String

var myOptionalName: String? = "Alexandr"


// Unwrapping
// 1)
//var sentence = myName + myOptionalName!

var myNewName = myOptionalName!

// 2)
var realName = "Alex"
var nickName: String? = "Ken"

if let myNickName = nickName {
    print(myNickName)
}