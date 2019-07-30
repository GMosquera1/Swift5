import UIKit
import Foundation

// Swift 5.0 updates
// TODO: create a repo to highlight Swift 5.0 updates
// Prerequiste is Xcode 10.2 +
// Xcode 11 will be shipped with Swift 5.1
//==========================================================================
// Raw Strings
//==========================================================================
// Extended String Delimiters - https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
// "hello"
print("\"hello\"")
// prints raw string as "hello"
let message = #""hello""#
let programmingLanguage = "iOS"
// handling string interpolation by adding an extra # delimeter embedding in \#()
let pursuitMessage = #""Welcome to Pursuit's \#(programmingLanguage) 6.0 cohort""#
print(message)
print(pursuitMessage)
//==========================================================================
// Character Properties
//==========================================================================
// present emoji keyboard - control, command + space bar
let sentence = "1$🔥&4?ap*"
for char in sentence {
    if char.isLetter {
        print("letter: \(char)")
    }
    if char.isCurrencySymbol {
        print("currency symbol: \(char)")
    }
    if char.isSymbol {
        print("symbol: \(char)")
    }
    if char.isPunctuation {
        print("punctuation: \(char)")
    }
}
//==========================================================================
// Review map, filter, flatmap
//==========================================================================
let tweets = [ "starting the fall cycle at #pursuit",
               "#darnclosures are killing me",
               "dreams of an #ios #developer",
               "#swiftui is dope, #iosdeveloper #mindblown"
]
// use map, filter and flatmap to return an array of hashtags
// arrays are structs 
//filter
// first, convert the string into an array, and filter by a hashtag
func findHash (str: String) -> [String] {
    let arrayHash = str.components(separatedBy: " ")
    return arrayHash.filter{$0.starts(with: "#")}
}
// map - transforms elements and flatmap flattens out an array of elements
let tags = tweets.map{findHash(str: $0)}.flatMap{$0}
print(tags)

// output: ["#pursuit", "#darnclosures", "#ios", "#developer", "#swiftui", "#iosdeveloper", "#mindblown"]

let numStrings = ["1", "a","&", "9", "54", "🐬"]
// use compactMap to return only valid numbers from numStrings - compact map checks to see if elements are nil and returns non-nil values
var validNum = numStrings.compactMap{Int($0)}

print(validNum)

// Review mapValues

let dictionaryOfNums = [2: 2, 3: 3, 4: 4, 5: 5]

// given dictionaryOfNums square each value

// output: [2: 4,3:9, 4:16, 5:25]

//func doublingNums (dict: Array) -> [Array] {
//    var doubles = dict
//}

var doubles = dictionaryOfNums.mapValues{$0 * $0}
print(doubles)

let cities = ["Stockholm": true,
              "Tokyo" : nil,
              "Boston": true,
              "San Francisco": true,
              "London": nil ]
//perform compactMapValues on cities to return non-nil elements
//output ["Stockholm": true, "Boston": true, "San Francisco": true]

var validCities = cities.compactMapValues{$0}
print(validCities)
