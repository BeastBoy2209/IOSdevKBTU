import Cocoa

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned == String(cleaned.reversed())
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("Racecar"))
print(isPalindrome("Hello, world!"))
