import Foundation
class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    func addItem(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: 1)
        } else {
            let newItem = CartItem(product: product, quantity: 1)
            items.append(newItem)
        }
    }
    
    func removeItem(_ productId: String) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items.remove(at: index)
        }
    }
    
    func updateItemQuantity(productId: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            if quantity == 0 {
                items.remove(at: index)
            } else {
                items[index].updateQuantity(quantity)
            }
        }
    }

    func clearCart() {
        items = []
    }

    var subtotal: Double {
        var sum = 0.0
        for item in items {
            sum += item.subtotal
        }
        return sum
    }

    var discountAmount: Double {
        // Example: "SAVE10" = 10% off, "SAVE20" = 20% off
        guard let code = discountCode else { return 0.0 }
        
        if code == "SAVE10" {
            return subtotal * 0.1
        } else if code == "SAVE20" {
            return subtotal * 0.2
        } else {
            return 0.0
        }
    }

    var total: Double {
        return subtotal - discountAmount
    }

    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }

    var isEmpty: Bool { // no items - true
        return items.isEmpty
    }
}
