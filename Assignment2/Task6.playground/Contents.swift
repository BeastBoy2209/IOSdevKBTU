import Cocoa

func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else { return [] }
    if n == 1 {
        return [0]
    }

    var sequence: [Int] = [0, 1]
    for _ in 2..<n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }

    return sequence
}

print(fibonacci(0))
print(fibonacci(1))
print(fibonacci(5))
print(fibonacci(10))
