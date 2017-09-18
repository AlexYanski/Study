

// Class vs Struct


class HumanClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var humanClassObj = HumanClass(name: "Alex")
humanClassObj.name

var newClassObj = humanClassObj   // Same memory place
newClassObj.name // "Alex"
newClassObj.name = "Alexandr"

humanClassObj.name





struct HumanStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var structObject = HumanStruct(name: "Alex")
structObject.name

var newStructObj = structObject
newStructObj.name
newStructObj.name = "Alexandr"
structObject.name

// Struct more faster, then class
// And more safe

