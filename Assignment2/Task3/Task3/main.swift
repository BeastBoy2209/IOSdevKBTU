import Foundation

var tempType: String = ""
var number: Double = 0.0
var tempType2: String = ""

print("Enter temperature character C/K/F")
while true {
    if let input = readLine(), input == "C" || input == "K" || input == "F" {
        tempType = input
        print("Success")
        break
    } else {
        print("Reenter temperature character")
    }
}

print("Enter temperature")
while true {
    if let temp = readLine(), let value = Double(temp) {
        number = value
        print("Success")
        break
    } else {
        print("Reenter temperature")
    }
}

print("Enter conversion type C/F/K")
while true {
    if let input = readLine(), input == "C" || input == "K" || input == "F" {
        tempType2 = input
        print("Success")
        break
    } else {
        print("Reenter temperature type")
    }
}

func convertTemperature(_ value: Double, from: String, to: String) -> Double {
    if from.uppercased() == to.uppercased() {
        return value
    }
    
    let celsius: Double
    switch from.uppercased() {
    case "C": celsius = value
    case "K": celsius = value - 273.15
    case "F": celsius = (value - 32) * 5.0 / 9.0
    default:  celsius = value
    }
    
    switch to.uppercased() {
    case "C": return celsius
    case "K": return celsius + 273.15
    case "F": return celsius * 9.0 / 5.0 + 32
    default:  return celsius
    }
}

let result = convertTemperature(number, from: tempType, to: tempType2)
print("Converted temperature: \(String(format: "%.2f", result)) \(tempType2)")

