

// Type Casting

// Ex 1)

class BaseClass {
    var baseProp = 123
}

class ChildClass: BaseClass {
    var childProp = 12345
}

var childObj = ChildClass()
childObj.childProp
childObj.baseProp


var newChildClass = childObj as BaseClass

newChildClass.baseProp


// Ex 2) Upcasting
var myName = "Alex" as Any
var myNumber = 20 as Any

var newArray = [myName, myNumber]

// Ex 3) Downcasting
// as?, (as!)

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "M1", director: "D1"),
    Movie(name: "M2", director: "D2"),
    Song(name: "S1", artist: "A2"),
    Song(name: "S2", artist: "A2")
]

// Optional downcasting

for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)' \nDir.:'\(movie.director)'")
    }
    
    if let song = item as? Song {
        print("Song: '\(song.name)' \nArt.:'\(song.artist)'")

    }
}



