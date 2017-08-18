

var friendList = ["Dima","Petya","Ivan"]

print(friendList[0])
print(friendList[1])
print(friendList[2])


// For in

for name in friendList {
    print(name)
}


for name in friendList {
    if name == "Dima" {
        print("I am the Dima")
    } else {
        print("I am not Dima")
    }
}

var myInfo = ["Hair Color":"Brown", "Height":"195", "Eye Color":"Gray"]

for (key, value) in myInfo {
    print("\(key): \(value)")
}