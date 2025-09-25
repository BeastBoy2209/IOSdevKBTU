import UIKit

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    for n in 2...Int(Double(number).squareRoot()) {
        if number % n == 0 {
            return false
        }
    }
    return true
}

var n = 10;
if isPrime(n) {
    print("n is a prime number")
} else {
    print("n is not a prime number")
}
