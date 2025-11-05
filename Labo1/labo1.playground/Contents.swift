import UIKit

var greeting = "Hello, playground"

//github uitleg:

//git init (1x)
//git add
//git add . voegt alles van de directory toe
//orgin toevoegen git remote add orgin git
//main branch naam veranderen via branch -M main
//git push -u orgin main voor te pushen naar repository

//git add.
//git commit -m "..."
//git push -u orgin main

//in map .ssh kun je keys zien, om keys aan te maken moet je ssh-keygen te gebruiken om keys te genereren
//in github dan de key toevoegen via settings -> SSH ... keys - > new SSH key

//Deel 1
var text = "SWIFT"
let max = 10
var average = 0.0

for char in text {
    //voor te casten naar string
    print("\(char)")
}

var naam = (voornaam: "ILona", familienaam: "Defevere")
print("\(naam.voornaam)")
print("\(naam.familienaam)")

var reversedString : String? = nil
if reversedString == nil {
    print("no result")
} else {
    print("\(reversedString!)")
}

//Deel 2
func reverseString(value: String?) -> (String) {
    if(value == nil) {
        return ""
    } else {
        //waarde reversed teruggeven
        return String(value!.reversed())
    }
}
print(reverseString(value: "Vives"))
print(reverseString(value: nil))

func getUpperLowerCount (value: String) -> (String, Int) {
    var lowercased = value.lowercased()
    var aantalCharacters = value.count
    return (lowercased, aantalCharacters)
}
var result = getUpperLowerCount(value: "iOS 26")
print(result.0.uppercased())
print(result.0)
print(result.1)
print(result)

func divide (getal1: Int, getal2: Int) -> (Double) {
    return Double(getal1) / Double(getal2)
}
print(divide(getal1: 4, getal2: 2))
print(divide(getal1: 1, getal2: 0))

func calculate (numbers: Double...) -> (Double?) {
    //om te controleren of er wel iets in numbers zit
    //.isEmpty
    if (numbers.isEmpty) {
        return nil
    } else {
        var sum = 0.0
        for number in numbers {
            sum += number
        }
        return Double(sum) / Double(numbers.count)
    }
}
print("\(calculate(numbers:10,0,5))")
print("\(calculate(numbers:4,5,6,-3))")
print("\(calculate(numbers:-3))")
print("\(calculate())")

var x = 10.0
var y = 3
//inout parameters
func increment (_ x: inout Double, _ y: inout Int) {
    x += 1
    y += 1
}
//moeten hier dan met & ervoor worden weergegeven
increment(&x,&y)
print(x)
print(y)

//Deel 3
enum StringConversionError: Error {
    case nilParameter
    case emptyParameter
}

func getUpperLowerCount(value: String?) throws -> (String, Int) {
    // Guard om nil te checken
    guard let value = value else {
        throw StringConversionError.nilParameter
    }

    // Guard om lege string te checken
    guard value != "" else {
        throw StringConversionError.emptyParameter
    }

    let lowercased = value.lowercased()
    let aantalCharacters = value.count
    return (lowercased, aantalCharacters)
}

do {
    let result = try getUpperLowerCount(value: nil)
} catch StringConversionError.nilParameter {
    print("Fout: de parameter is nil!")
}
do {
    let result = try getUpperLowerCount(value: "")
} catch StringConversionError.nilParameter {
    print("Fout: de parameter heeft geen waarde!")
} 

//Deel 4
enum iPhoneTypes {
    case iPhoneAir
    case iPhone17Pro
    case iPhone17ProMax
    case iPhone17
}

struct Iphone {
    let supplier = "Apple"
    var type: iPhoneTypes?
    var dimension: (width: Double, height: Double)
    // Computed property
    var description: String {
        guard let type = type else {
            return "Geen type gespecificeerd"
        }
        
        switch type {
        case .iPhoneAir:
            return "iPhone Air met afmetingen \(dimension.width) x \(dimension.height)"
        case .iPhone17Pro:
            return "iPhone 17 Pro met afmetingen \(dimension.width) x \(dimension.height)"
        case .iPhone17ProMax:
            return "iPhone 17 Pro Max met afmetingen \(dimension.width) x \(dimension.height)"
        case .iPhone17:
            return "iPhone 17 met afmetingen \(dimension.width) x \(dimension.height)"
        }
    }

    init() {
        dimension.width = 0.0
        dimension.height = 0.0
        type = nil
    }
}

var iPhoneAir = Iphone()
var iPhoneAir2 = Iphone()
iPhoneAir2.type = iPhoneTypes.iPhoneAir
iPhoneAir2.dimension.width = 7.47
iPhoneAir2.dimension.height = 15.62

print(iPhoneAir.description)
print(iPhoneAir2.description)

// Deel 5
var namen = ["Dirk", "Els", "Marc", "Eline", "Dominiek"]

let namenMetD = namen.filter { $0.first == "D" }
print(namenMetD)

func filterArr(naam: String) -> Bool {
    return naam.first == "D"
}

let filtered2 = namen.filter(filterArr)
print(filtered2)

func filterArrExtended(naam: String, letter: Character) -> Bool {
    return naam.first == letter
}

let filtered3 = namen.filter { filterArrExtended(naam: $0, letter: "D") }
print(filtered3)

let kleineNamen = namen.map { naam in
    return naam.lowercased()
}

let namenLengte = namen.map { naam in
    return naam.count
}