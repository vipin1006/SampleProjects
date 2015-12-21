//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


var letters = [NSMutableSet]()

var set = NSMutableSet()

var someSet = Set<String>()
let abcSet: Set = ["A", "B", "C", "D"]
var foodSet = Set(["Salad", "Chips", "Sandwiches"])

set.addObject("test")
someSet.insert("Test")
letters.append(set)
print(letters.dynamicType)


var array = [Array<String>]()

var string = [String]()

string.append("string")

array.append(string)


var names : Dictionary<String,String> = ["a":"s","s":"f"]


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

var i = 0
repeat {
   i++
    print(i)
} while i < 4


let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map
    {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

debugPrint(string)

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let nextCustomer = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)


print("Now serving \(nextCustomer())!")

print(customersInLine.count)

func serveNextCustomer(customer: () -> String) {
    print("Now serving \(customer())!")
}
serveNextCustomer( { customersInLine.removeAtIndex(0) } )

func serveNextCustomer(@autoclosure customer: () -> String) {
    print("Now serving \(customer())!")
}
serveNextCustomer(customersInLine.removeAtIndex(0))


var customerClosures: [() -> String] = []

func collectCustomerClosures(@autoclosure(escaping) customer: () -> String) {
    customerClosures.append(customer)
}
collectCustomerClosures(customersInLine.removeAtIndex(0))
collectCustomerClosures(customersInLine.removeAtIndex(0))

print("Collected \(customerClosures.count) closures.")
// prints "Collected 2 closures."
for customerClosure in customerClosures
{
    print("Now serving \(customerClosure())!")
}


let controlArray = [NSString(), NSTextField(), NSSet()]

for item in controlArray {
    if let someLabel = item as? NSString {
       // var storeText = someLabel.text
        print(someLabel)
    }
    else if let someDatePicker = item as? NSTextField {
       // var storeDate = someDatePicker.date
        print(someDatePicker)
    }
}

