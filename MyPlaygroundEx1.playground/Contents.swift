print("Hello World!")
let num1 = "I'm "
let year = 19
let str = num1 + "\(year)"
print(str)

//-------------------------------------------------------------------------------------------------------------------------------------------

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
print(appleSummary,fruitSummary)

//-------------------------------------------------------------------------------------------------------------------------------------------

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print(shoppingList)

//-------------------------------------------------------------------------------------------------------------------------------------------

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)

//-------------------------------------------------------------------------------------------------------------------------------------------

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score: Int in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//-------------------------------------------------------------------------------------------------------------------------------------------

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
    print(greeting)
}

//-------------------------------------------------------------------------------------------------------------------------------------------

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

//-------------------------------------------------------------------------------------------------------------------------------------------

let vegetable = "red peper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("peper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

//-------------------------------------------------------------------------------------------------------------------------------------------

let interestingNumbers = [
    "Prime": [2, 30, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//-------------------------------------------------------------------------------------------------------------------------------------------

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

//-------------------------------------------------------------------------------------------------------------------------------------------

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

//-------------------------------------------------------------------------------------------------------------------------------------------

func greet(person: String, day: String) -> String{
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

//-------------------------------------------------------------------------------------------------------------------------------------------

func greet(_ person: String,_ day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John",  "Wednesday")

//-------------------------------------------------------------------------------------------------------------------------------------------

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//-------------------------------------------------------------------------------------------------------------------------------------------

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12, 45)

//-------------------------------------------------------------------------------------------------------------------------------------------

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

returnFifteen()

//-------------------------------------------------------------------------------------------------------------------------------------------

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//-------------------------------------------------------------------------------------------------------------------------------------------

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//-------------------------------------------------------------------------------------------------------------------------------------------

//-------------------------------------------------------------------------------------------------------------------------------------------
