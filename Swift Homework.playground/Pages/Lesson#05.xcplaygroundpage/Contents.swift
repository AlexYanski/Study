
//BAD CODE
var myAge = 20

if myAge >= 1 && myAge <= 10 {
    print("Milk")
} else if myAge >= 11 && myAge <= 40 {
    print("Soda")
} else {
    print("Water")
}

// Switch Statment

switch myAge {
case 1...10:
    print("Milk")
case 11...40:
    print("Soda")
default:
    print("Water")
}

// Switch + For In Loop

var myFood = ["Meat","Pizza","Rice","Water"]

for food in myFood {
    
    switch food {
    case "Meat":
        print("I ate Meat")
    case "Pizza":
        print("I ate Pizza")
    default:
        print("I ate something else")
    }
}