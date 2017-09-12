
// Subscripts
// Ex 1)

struct TimesTable {
    
    let multipler: Int
    subscript(index: Int) -> Int {
        return multipler * index
    }
}

let threeTimesTable = TimesTable(multipler: 3)

threeTimesTable[5]
threeTimesTable[2]
threeTimesTable[64]



// Ex 2)

class WeekDay {
    var day = ["Mon","Tue","Wed","Thu","Fri"]
    subscript(index: Int) -> String {
        return day[index]
    }
}

var someDay = WeekDay()
someDay[2]



// Ex 3)

struct HealthInfo {
    var info = ["Height": 196.0, "Weight": 98.0]
    subscript(key: String) -> Double {
        if let newInfo = info[key] {
            return newInfo
        } else {
            return 0
        }
    }
}

let alex = HealthInfo()
alex.info
alex["Height"]