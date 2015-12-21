//: Playground - noun: a place where people can play

import Cocoa

//  Generics

//  Generic code enables you to write flexible, reusable functions and types that can work with any type

//  To avoid duplication
//  It will be clear
//  Array<Element> , Dictionary<Key,Value> called generics collections


// The Problem that generics solve


func swapTwoInts(inout a: Int, inout _ b: Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(inout a: String, inout _ b: String)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = "Exilant"
var anotherString = "Technology"
swapTwoStrings(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")

func swapTwoDoubles(inout a: Double, inout _ b: Double)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someDouble = 44.55
var anotherDouble = 66.77
swapTwoDoubles(&someDouble, &anotherDouble)
print("someDouble is now \(someDouble), and anotherDouble is now \(anotherDouble)")



//  Generic Function

//  comparision of normal func and generic func

//  func swapTwoInts(inout a: Int, inout _ b: Int)
//  func swapTwoValues<PlaceHolderName>(inout a: PlaceHolderName, inout _ b: PlaceHolderName)

//  Here PlaceHolderName is a type parameters
//  The PlaceHolderName is replaced with actual data type(Such as Int, String, etc) when the method is called first
//  You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas
//  Meaningful names in Array<Element>, Dictionary<Key,Value>
//  Not meaningful in generic func, you can specify the name like T,U and PlaceHolder


func swapTwoValues<MyTypeParameter>(inout a: MyTypeParameter, inout _ b: MyTypeParameter)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someValue = 4
var anotherValues = 108
swapTwoValues(&someValue, &anotherValues)

print("someValue is now \(someValue), and anotherValue is now \(anotherValues)")

var stringOne = "hello"
var stringTwo = "world"
swapTwoValues(&stringOne, &stringTwo)

print("stringOne is now \(stringOne), and stringTwo is now \(stringTwo)")

// Generic Types

//  Swift enables you to define your own generic types. These are custom classes, structures, and enumerations that can work with any type

// Non-Generics Version

struct StackInt
{
    var items = [Int]()
    mutating func push(item: Int)
    {
        items.append(item)
    }
    mutating func pop() -> Int
    {
        return items.removeLast()
    }
}

var stackInt = StackInt()
stackInt.push(10)
stackInt.push(20)
print(stackInt.items)
stackInt.pop()
print(stackInt.items)

// Generics Version os Stack

struct Stack<Element>
{
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
   
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

print(stackOfStrings.items)

let fromTheTop = stackOfStrings.pop()

print(stackOfStrings.items)

var stackOfDouble = Stack<Double>()
stackOfDouble.push(12.22)
stackOfDouble.push(22.33)
stackOfDouble.push(33.44)
stackOfDouble.push(55.66)

print(stackOfDouble.items)

let fromTheTopDouble = stackOfDouble.pop()

print(stackOfDouble.items)


//  Extending generic Type

// No need to provide the placeholdername along with extension definition

extension Stack
{
    var topItem: Element?
    {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem
{
    print("The top item on the stack is \(topItem).")
}


// Type Constraints

// Example for type constraints is Dictionary<Key,Value>

// Hashable

func ==(lhs: DictionaryExample, rhs: DictionaryExample) -> Bool
{
    return lhs.hashValue == rhs.hashValue
}

class DictionaryExample: Hashable
{
    var point : CGPoint
    var hashValue : Int
    {
        get
        {
            return "\(self.point.x),\(self.point.y)".hashValue
        }
    }
    init(point:CGPoint)
    {
        self.point = point
    }
}   

var str = "1234"
var result = 0
var i = 0
for index in str.characters
{
    i++
    var a = "\(index)"
    result = result+Int(a)!
}

print(i)

print(result)

var pointOne = DictionaryExample(point: CGPoint(x: 1, y: 0))
var pointTwo = DictionaryExample(point: CGPoint(x: 1, y: 0))
var pointThree = DictionaryExample(point: CGPoint(x: 0, y: 1))

pointOne == pointTwo
pointTwo == pointThree

func callBack(element:Any)
{
    print(element)
    
}

callBack(12)
callBack("select")

class Test
{
    
}

var namesOfIntegers = [DictionaryExample: String]()
namesOfIntegers[pointOne] = "StringOne"
namesOfIntegers[pointThree] = "StringTwo"

print(namesOfIntegers)


//  All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default.

//  Syntax

//  func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U)
//  {
//    // function body goes here
//  }

protocol PersonProtocol
{
    
}

class Person
{
   
}

class Address: Person,PersonProtocol
{
    
}


func personMethod<T: Person, U: PersonProtocol>(somePerson:T, personProtocol:U)
{
    print("Address called")
}

var address = Address()
personMethod(address,personProtocol: address)

//var person = Person()
//personMethod(person,person)



// Type Constaint in Action

// Without Type Constaint in Action

// Non-Generics function


func findStringIndex(array: [String], _ valueToFind: String) -> Int?
{
    for (index, value) in array.enumerate()
    {
        if value == valueToFind
        {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama")
{
    print("The index of llama is \(foundIndex)")
}

// Generics with

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int?
{
    for (index, value) in array.enumerate()
    {
        if value == valueToFind
        {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex([3.14159, 0.1, 0.25],0.2)

let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")

let dictionaryIndex = findIndex([pointOne,pointTwo], pointThree)

//let personOne = Person()
//let personTwo = Person()
//
//let personIndex = findIndex([personOne,personTwo], personOne)

// Associated Types

//  When defining a protocol, it is sometimes useful to declare one or more associated types as part of the protocol’s definition

protocol Container
{
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container
{
    // original IntStack implementation
    var items = [Int]()
    mutating func push(item: Int)
    {
        items.append(item)
    }
    mutating func pop() -> Int
    {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias ItemType = Int
    mutating func append(item: Int)
    {
        self.push(item)
    }
    var count: Int
    {
        return items.count
    }
    subscript(i: Int) -> Int
    {
        return items[i]
    }
    
}

var intStack = IntStack()
intStack.append(1)
intStack.append(2)
intStack.append(3)

print(intStack.items[1])
print(intStack.count)

intStack.pop()

print(intStack.count)

struct StackAssociated<Element>: Container
{
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(item: Element)
    {
        items.append(item)
    }
    mutating func pop() -> Element
    {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: Element)
    {
        self.push(item)
    }
    var count: Int
    {
        return items.count
    }
    subscript(i: Int) -> Element
    {
        return items[i]
    }
   
}

var stackAssociated = StackAssociated<String>()

stackAssociated.append("aaa")
stackAssociated.append("bbb")
stackAssociated.append("ccc")
stackAssociated.append("ddd")

print(stackAssociated.count)

stackAssociated.pop()

print(stackAssociated.count)

var stackDouble = StackAssociated<Double>()

stackDouble.append(22.33)
stackDouble.append(44.22)

print(stackDouble.count)

stackDouble.pop()

print(stackDouble.count)

// Where clauses

func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, _ anotherContainer: C2) -> Bool {
        
        // check that both containers contain the same number of items
        if someContainer.count != anotherContainer.count
        {
            return false
        }
        
        // check each pair of items to see if they are equivalent
        for i in 0..<someContainer.count
        {
            if someContainer[i] != anotherContainer[i]
            {
                return false
            }
        }
        
        // all items match, so return true
        return true
        
}

extension Array: Container{}

var stackOfString = StackAssociated<String>()
stackOfString.push("uno")
stackOfString.push("dos")
stackOfString.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

var arrayOfString = ["uno", "dos", "tres"]


if allItemsMatch(stackOfString,arrayOfStrings)
{
    print("All items match.")
}
else
{
    print("Not all items match.")
}




