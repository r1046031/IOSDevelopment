import UIKit

var greeting = "Hello, playground"

//github uitleg:

//git init (1x)
//git add
//git add . voegt alles van de directory toe
//orgin toevoegen git remote add orgin git
//git push voor te pushen naar repository

//in map .ssh kun je keys zien, om keys aan te maken moet je ssh-keygen te gebruiken om keys te genereren
//in github dan de key toevoegen via settings -> SSH ... keys - > new SSH key

//Deel 1
var text = "SWIFT"
let max = 10
var average = 0.0

for character in text {
    print(character)
}

var naam = (voornaam, familienaam)

var reversedString : String? = nil
if reversedString == nil {
    print("no result")
} else {
    print(reversedString)
}

//Deel 2
func reverseString(value: String) {
    print(value.reversed())
}

reverseString(value: "Vives")
