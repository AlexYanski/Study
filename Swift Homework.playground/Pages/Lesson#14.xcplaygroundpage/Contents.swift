
// Extension

// DRY

// Ex 1)

extension String {
    func sayHello() {
        print("Hello")
    }
}

var hello = "Hi"
hello.sayHello()

"Hey".sayHello()


// Ex 2)

extension Int {
    var squared: Int {
        return (self * self)
    }
}

var newInt = 40
newInt.squared

140.squared


// Ex 3)

class Alex {
    var nickName = "Ken"
    
}

var realAlex = Alex()
realAlex.nickName


extension Alex {
    func describeYourself() -> String {
        return "My name is Alex."
    }
}

realAlex.describeYourself()