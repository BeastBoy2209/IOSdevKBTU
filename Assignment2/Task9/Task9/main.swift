import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    guard b != 0 else { return nil }
    return a / b
}

while true {
    print("\nEnter first number (or type 'exit' to quit):")
    guard let input1 = readLine(), input1.lowercased() != "exit" else {
        print("Exiting calculator…")
        break
    }
    guard let num1 = Double(input1) else {
        print("Invalid number. Try again.")
        continue
    }

    print("Enter second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid number. Try again.")
        continue
    }

    print("Choose operation (+, -, *, /):")
    guard let op = readLine() else {
        print("Invalid operation.")
        continue
    }

    var result: Double?

    switch op {
    case "+":
        result = add(num1, num2)
    case "-":
        result = subtract(num1, num2)
    case "*":
        result = multiply(num1, num2)
    case "/":
        if let res = divide(num1, num2) {
            result = res
        } else {
            print("Error: Division by zero.")
            continue
        }
    default:
        print("Unknown operation.")
        continue
    }

    if let res = result {
        print("Result: \(res)")
    }
}
