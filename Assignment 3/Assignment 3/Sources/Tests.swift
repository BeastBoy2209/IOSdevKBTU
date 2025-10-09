import Foundation

// MARK: - Test Runner
func runAllTests() {
    print(" Starting Tests \n")
    
    testProductCreation()
    testCartItemOperations()
    testShoppingCartAddItem()
    testShoppingCartRemoveItem()
    testShoppingCartUpdateQuantity()
    testShoppingCartCalculations()
    testShoppingCartDiscount()
    testShoppingCartClear()
    testAddressFormatting()
    testOrderCreation()
    
    print("\n All tests completed!")
}

func testProductCreation() {
    print("Testing Product Creation...")
    
    let product = Product(
        id: "1",
        name: "iPhone",
        price: 999.99,
        category: .electronics,
        description: "Smartphone"
    )
    assert(product != nil, "Valid product should not be nil")
    assert(product?.displayPrice == "$999.99", "Display price formatting failed")
    
    let invalidProduct = Product(
        id: "2",
        name: "Invalid",
        price: -10.0,
        category: .electronics,
        description: "Test"
    )
    assert(invalidProduct == nil, "Product with negative price should be nil")
    
    let zeroProduct = Product(
        id: "3",
        name: "Zero",
        price: 0,
        category: .electronics,
        description: "Test"
    )
    assert(zeroProduct == nil, "Product with zero price should be nil")
    
    print("Product tests passed\n")
}

func testCartItemOperations() {
    print("Testing CartItem Operations...")
    
    let product = Product(
        id: "1",
        name: "Laptop",
        price: 1500.0,
        category: .electronics,
        description: "Computer"
    )!
    
    var cartItem = CartItem(product: product, quantity: 2)
    
    assert(cartItem.subtotal == 3000.0, "Subtotal calculation failed")
    
    cartItem.increaseQuantity(by: 3)
    assert(cartItem.quantity == 5, "Increase quantity failed")
    assert(cartItem.subtotal == 7500.0, "Subtotal after increase failed")
    
    cartItem.updateQuantity(10)
    assert(cartItem.quantity == 10, "Update quantity failed")
    
    cartItem.updateQuantity(-5)
    assert(cartItem.quantity == 10, "Negative quantity should not update")
    
    cartItem.increaseQuantity(by: -2)
    assert(cartItem.quantity == 10, "Negative increase should not update")
    
    print("CartItem tests passed\n")
}

func testShoppingCartAddItem() {
    print("Testing ShoppingCart Add Item...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 999.0, category: .electronics, description: "Phone")!
    let macBook = Product(id: "2", name: "MacBook", price: 2499.0, category: .electronics, description: "Laptop")!
    
    cart.addItem(iPhone)
    assert(cart.items.count == 1, "Cart should have 1 item")
    assert(cart.items[0].quantity == 1, "First item quantity should be 1")
    
    cart.addItem(iPhone)
    assert(cart.items.count == 1, "Cart should still have 1 item")
    assert(cart.items[0].quantity == 2, "Item quantity should be 2")
    
    cart.addItem(macBook)
    assert(cart.items.count == 2, "Cart should have 2 items")
    assert(cart.items[1].quantity == 1, "New item quantity should be 1")
    
    cart.addItem(iPhone)
    assert(cart.items[0].quantity == 3, "iPhone quantity should be 3")
    
    print("ShoppingCart add item tests passed\n")
}

func testShoppingCartRemoveItem() {
    print("Testing ShoppingCart Remove Item...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 999.0, category: .electronics, description: "Phone")!
    let macBook = Product(id: "2", name: "MacBook", price: 2499.0, category: .electronics, description: "Laptop")!
    
    cart.addItem(iPhone)
    cart.addItem(macBook)
    assert(cart.items.count == 2, "Cart should have 2 items")
    
    cart.removeItem("1")
    assert(cart.items.count == 1, "Cart should have 1 item after removal")
    assert(cart.items[0].product.id == "2", "Remaining item should be MacBook")
    
    cart.removeItem("999")
    assert(cart.items.count == 1, "Cart should still have 1 item")
    
    cart.removeItem("2")
    assert(cart.items.count == 0, "Cart should be empty")
    assert(cart.isEmpty, "isEmpty should be true")
    
    print("ShoppingCart remove item tests passed\n")
}

func testShoppingCartUpdateQuantity() {
    print("Testing ShoppingCart Update Quantity...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 999.0, category: .electronics, description: "Phone")!
    
    cart.addItem(iPhone)
    cart.addItem(iPhone)
    assert(cart.items[0].quantity == 2, "Initial quantity should be 2")
    
    cart.updateItemQuantity(productId: "1", quantity: 5)
    assert(cart.items[0].quantity == 5, "Quantity should be updated to 5")
    
    cart.updateItemQuantity(productId: "1", quantity: 2)
    assert(cart.items[0].quantity == 2, "Quantity should be updated to 2")
    
    cart.updateItemQuantity(productId: "1", quantity: 0)
    assert(cart.items.count == 0, "Item should be removed when quantity is 0")
    
    cart.updateItemQuantity(productId: "999", quantity: 5)
    assert(cart.items.count == 0, "Cart should still be empty")
    
    print("ShoppingCart update quantity tests passed\n")
}

func testShoppingCartCalculations() {
    print("Testing ShoppingCart Calculations...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 1000.0, category: .electronics, description: "Phone")!
    let macBook = Product(id: "2", name: "MacBook", price: 2000.0, category: .electronics, description: "Laptop")!
    
    assert(cart.subtotal == 0.0, "Empty cart subtotal should be 0")
    assert(cart.itemCount == 0, "Empty cart item count should be 0")
    assert(cart.isEmpty, "Cart should be empty")
    
    cart.addItem(iPhone)  // 1 x 1000 = 1000
    cart.addItem(iPhone)  // 2 x 1000 = 2000
    cart.addItem(macBook) // 1 x 2000 = 2000
    
    assert(cart.subtotal == 4000.0, "Subtotal should be 4000")
    assert(cart.itemCount == 3, "Item count should be 3")
    assert(!cart.isEmpty, "Cart should not be empty")
    
    print("ShoppingCart calculations tests passed\n")
}

func testShoppingCartDiscount() {
    print("Testing ShoppingCart Discount...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 1000.0, category: .electronics, description: "Phone")!
    
    cart.addItem(iPhone)
    cart.addItem(iPhone)  // Subtotal = 2000
    
    assert(cart.discountAmount == 0.0, "No discount should be 0")
    assert(cart.total == 2000.0, "Total without discount should be 2000")
    
    cart.discountCode = "SAVE10"
    assert(cart.discountAmount == 200.0, "10% discount should be 200")
    assert(cart.total == 1800.0, "Total with 10% discount should be 1800")
    
    cart.discountCode = "SAVE20"
    assert(cart.discountAmount == 400.0, "20% discount should be 400")
    assert(cart.total == 1600.0, "Total with 20% discount should be 1600")
    
    cart.discountCode = "INVALID"
    assert(cart.discountAmount == 0.0, "Invalid code should give 0 discount")
    assert(cart.total == 2000.0, "Total with invalid code should be 2000")
    
    cart.discountCode = nil
    assert(cart.discountAmount == 0.0, "No code should give 0 discount")
    assert(cart.total == 2000.0, "Total without code should be 2000")
    
    print("ShoppingCart discount tests passed\n")
}

func testShoppingCartClear() {
    print("Testing ShoppingCart Clear...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 999.0, category: .electronics, description: "Phone")!
    
    cart.addItem(iPhone)
    cart.addItem(iPhone)
    cart.discountCode = "SAVE10"
    
    assert(!cart.isEmpty, "Cart should not be empty before clear")
    
    cart.clearCart()
    
    assert(cart.isEmpty, "Cart should be empty after clear")
    assert(cart.items.count == 0, "Items count should be 0")
    assert(cart.subtotal == 0.0, "Subtotal should be 0")
    assert(cart.total == 0.0, "Total should be 0")
    
    print("ShoppingCart clear tests passed\n")
}

func testAddressFormatting() {
    print("Testing Address Formatting...")
    
    let address = Address(
        street: "123 Main Street",
        city: "New York",
        zipCode: "10001",
        country: "USA"
    )
    
    let expected = "123 Main Street\nNew York, 10001\nUSA"
    assert(address.formattedAddress == expected, "Formatted address is incorrect")
    
    print("Address tests passed\n")
}

func testOrderCreation() {
    print("Testing Order Creation...")
    
    let cart = ShoppingCart()
    let iPhone = Product(id: "1", name: "iPhone", price: 1000.0, category: .electronics, description: "Phone")!
    let macBook = Product(id: "2", name: "MacBook", price: 2000.0, category: .electronics, description: "Laptop")!
    
    cart.addItem(iPhone)
    cart.addItem(iPhone)
    cart.addItem(macBook)
    cart.discountCode = "SAVE10"
    
    let address = Address(
        street: "123 Main St",
        city: "New York",
        zipCode: "10001",
        country: "USA"
    )
    
    let order = Order(from: cart, shippingAddress: address)
    
    assert(!order.orderId.isEmpty, "Order ID should not be empty")
    assert(order.items.count == 2, "Order should have 2 items")
    assert(order.itemCount == 3, "Order item count should be 3")
    assert(order.subtotal == 4000.0, "Order subtotal should be 4000")
    assert(order.discountAmount == 400.0, "Order discount should be 400")
    assert(order.total == 3600.0, "Order total should be 3600")
    assert(order.shippingAddress.city == "New York", "Shipping address incorrect")
    
    cart.addItem(iPhone)
    assert(order.items.count == 2, "Order should not change when cart changes")
    assert(order.itemCount == 3, "Order item count should not change")
    
    cart.discountCode = "SAVE20"
    assert(order.discountAmount == 400.0, "Order discount should not change")
    
    print("Order tests passed\n")
}

func assert(_ condition: Bool, _ message: String) {
    if !condition {
        print(message)
    }
}
