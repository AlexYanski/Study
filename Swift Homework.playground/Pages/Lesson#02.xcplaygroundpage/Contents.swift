//: Playground - noun: a place where people can play

//Conditional Statment

1 == 1
1 == 2

1 != 2
1 != 1

"Bob" == "Bob"
"Bob" == "Bobby"

1 > 0
1 < 0
1 >= 0
1 <= 0

var type = (1 == 1)
print(type)

//------------

var balance = 1000

if balance < 0 {
    print("You can't withdraw any money")
} else {
    print("You can withdraw maximum $\(balance)")
}

//------------

var username = "alex"
var password = 123

if (username == "alex" && password == 123) {
    print("You may log in")
} else if (username == "alex" || password == 123) {
    print("Your username or password wrong")
} else {
    print("Both wrong")
}

//------------

