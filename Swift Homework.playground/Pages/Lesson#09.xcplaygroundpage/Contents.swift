


var bob = ["Hair Color":"Brown", "Height":"195", "Eye Color":"Gray"]
var ron = ["Hair Color":"Brown", "Height":"175", "Eye Color":"Clear"]
var max = ["Hair Color":"Blonde", "Height":"183", "Eye Color":"Brown"]


// Structure & BluPrint

struct Human {
    var numberOfLegs: Int
    var numberOfFingers: Int
    var name: String
    
    func sayName() {
        print(name)
    }
}

var dan = Human(numberOfLegs: 2, numberOfFingers: 10, name: "Dan")

dan.name
dan.numberOfLegs
dan.sayName()

var bobby = Human(numberOfLegs: 2, numberOfFingers: 10, name: "Bob the Dev")

// Ex 2)

struct Cuboid {
    var width: Double, height: Double, depth: Double
    //Computed Property
    
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depth: 2)
fourByFiveByTwo.volume