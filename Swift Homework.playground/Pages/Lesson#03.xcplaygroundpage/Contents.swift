

// Array, Tupule, Dictionary

//Tupule

var randomList = (123, 123.0123, "String", true)
randomList.0
randomList.1
randomList.2
randomList.3


//Array

var friendList = ["Dima","Petya","Ivan"]

friendList.append("Bob")
print(friendList)

friendList.remove(at: 0)
print(friendList)

friendList.count
friendList.removeAll()

//Dictionary

var myInfo = ["Hair Color":"Brown", "Height":"195", "Eye Color":"Gray"]

myInfo["Height"]

myInfo.updateValue("10", forKey: "Shoe Size")
print(myInfo)

