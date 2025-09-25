import Foundation

var students: [String: Double] = [:]

print("Enter the number of students:")
if let input = readLine(), let count = Int(input), count > 0 {
    for i in 1...count {
        print("Enter name for student \(i):")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name, skipping.")
            continue
        }
        print("Enter score for \(name):")
        guard let scoreInput = readLine(), let score = Double(scoreInput) else {
            print("Invalid score, skipping.")
            continue
        }
        students[name] = score
    }
}

if !students.isEmpty {
    let scores = Array(students.values)
    let average = scores.reduce(0, +) / Double(scores.count)
    let highest = scores.max() ?? 0
    let lowest = scores.min() ?? 0

    print("\n===== Results =====")
    print("Average score: \(String(format: "%.2f", average))")
    print("Highest score: \(highest)")
    print("Lowest score: \(lowest)")

    print("\nStudent scores:")
    for (name, score) in students {
        let status = score >= average ? "above average" : "below average"
        print("\(name): \(score) (\(status))")
    }
} else {
    print("No student data entered.")
}
