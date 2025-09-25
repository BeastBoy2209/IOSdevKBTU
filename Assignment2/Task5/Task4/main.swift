import Foundation

print("Enter a sentence:")
if let input = readLine() {
    let lowercased = input.lowercased()
    let cleaned = lowercased.filter { char in
        char.isLetter || char.isWhitespace
    }
    
    let words = cleaned.split(separator: " ")
    var wordFrequency: [String: Int] = [:]
    
    for wordSub in words {
        let word = String(wordSub)
        wordFrequency[word, default: 0] += 1
    }
    
    print("\nWord frequencies:")
    for (word, count) in wordFrequency {
        print("\(word): \(count)")
    }
}
