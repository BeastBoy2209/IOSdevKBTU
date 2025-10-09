import Foundation
struct Order {
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int {
        var count = 0
        for item in items {
            count += item.quantity
        }
        return count
    }
}
