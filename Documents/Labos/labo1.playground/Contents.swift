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
    if (Double(numbers)) {
        return nil
    } else {
        var sum = 0.0
        for number in numbers {
            sum += number
        }
        return Double(sum) / Double(numbers.count)
    }
}
print("calculate(numbers:10,0,5)")
print(calculate(numbers:4,5,6,-3))
print(calculate(numbers:-3))
print(calculate())
