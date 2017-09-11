

//Struct vs Class

//Base class
class Human {
    var numberOfLegs = 2
    var numberOfFingers = 10
    func introduceMySelf() {
        print("I have \(numberOfLegs) legs and \(numberOfFingers) fingers")
    }
}
let human = Human()

//Child class
class Belarusian: Human {
    var citizenship = "Republic of Belarus"
    var homeTown = "Minsk"
    override func introduceMySelf() {
         print("I have \(numberOfLegs) legs and \(numberOfFingers) fingers. I am from \(homeTown)")
    }
}

// Inheritance

let bob = Belarusian()
bob.citizenship
bob.homeTown
bob.numberOfFingers
bob.numberOfLegs

human.introduceMySelf()
bob.introduceMySelf()