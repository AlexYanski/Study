
// Difference between Struct and Class

// 1) Struct x inherit

// 2) In Struct, it automatically allow you to input the value

struct MyStruct {
    var someProp: Double
    
}

var myStruct = MyStruct(someProp: 50)
myStruct.someProp

// Init for class

class MyClass {
    //var someProperty = 102.123
    var someProperty: Double
    
    init(addProperty: Double) {
        someProperty = addProperty
    }
}

var myClass = MyClass(addProperty: 123.123)
myClass.someProperty


// New Ex)

class Circle {
    var x: Int, y: Int
    var radius: Double
    var diameter: Double {
        return radius * 2
    }
    
    init(x: Int, y: Int, radius: Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }
}

var myCircle = Circle(x: 10, y: 10, radius: 20)
myCircle.diameter