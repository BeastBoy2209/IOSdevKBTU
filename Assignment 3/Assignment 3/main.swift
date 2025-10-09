import Foundation

runAllTests()

print("\n--- Manual Testing ---\n")

let cart = ShoppingCart()

let iPhone = Product(id: "1", name: "iPhone 15", price: 999.99, category: .electronics, description: "Latest iPhone")!
let macBook = Product(id: "2", name: "MacBook Pro", price: 2499.00, category: .electronics, description: "Powerful laptop")!

cart.addItem(iPhone)
cart.addItem(iPhone)
cart.addItem(macBook)

print("Items in cart: \(cart.itemCount)")
print("Subtotal: $\(cart.subtotal)")

cart.discountCode = "SAVE10"
print("Discount: $\(cart.discountAmount)")
print("Total: $\(cart.total)")

let address = Address(street: "123 Main St", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
print("\nShipping to:")
print(address.formattedAddress)

let order = Order(from: cart, shippingAddress: address)
print("\nOrder created!")
print("Order ID: \(order.orderId)")
print("Total items: \(order.itemCount)")
print("Order total: $\(order.total)")









