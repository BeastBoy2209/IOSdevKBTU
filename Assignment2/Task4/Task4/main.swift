import Foundation

var shoppingList: [String] = []

func showMenu() {
    print("""
    
    ====== Shopping List Manager ======
    1. Add item
    2. Remove item
    3. Show shopping list
    4. Exit
    Enter your choice:
    """)
}

while true {
    showMenu()
    
    guard let choice = readLine() else {
        print("Invalid input")
        continue
    }
    
    switch choice {
    case "1":
        print("Enter item to add:")
        if let item = readLine(), !item.isEmpty {
            shoppingList.append(item)
            print("'\(item)' added to the shopping list.")
        }
        
    case "2":
        if shoppingList.isEmpty {
            print("Shopping list is empty.")
        } else {
            print("Enter item to remove:")
            if let item = readLine() {
                if let index = shoppingList.firstIndex(of: item) {
                    shoppingList.remove(at: index)
                    print("'\(item)' removed from the shopping list.")
                } else {
                    print("'\(item)' not found in the shopping list.")
                }
            }
        }
        
    case "3":
        if shoppingList.isEmpty {
            print("Shopping list is empty.")
        } else {
            print("\nCurrent Shopping List:")
            for (index, item) in shoppingList.enumerated() {
                print("\(index + 1). \(item)")
            }
        }
        
    case "4":
        print("Exiting… Goodbye!")
        exit(0)
        
    default:
        print("Invalid choice. Please enter 1–4.")
    }
}
