🛒 Shopping Cart System

A complete shopping cart implementation in Swift, featuring product management, cart operations, discount codes, and order processing.

⸻

📋 Table of Contents
    •    ✨ Features
    •    📁 Project Structure
    •    🧩 Components
    •    🚀 Installation
    •    📝 Notes
    •    🎯 Key Concepts Demonstrated

⸻

✨ Features

✅ Product Management — Create and manage products with validation
✅ Shopping Cart — Add, remove, and update items
✅ Quantity Control — Automatic quantity management for duplicate products
✅ Discount Codes — Support for percentage-based discount codes
✅ Order Processing — Create immutable order snapshots
✅ Address Formatting — Structured shipping address handling
✅ Comprehensive Tests — Full test coverage for all components

⸻

📁 Project Structure

ShoppingCartAssignment/
├── Sources/
│   ├── Product.swift         # Product model with validation
│   ├── CartItem.swift        # Cart item with quantity management
│   ├── ShoppingCart.swift    # Main shopping cart logic
│   ├── Order.swift           # Immutable order snapshot
│   ├── Address.swift         # Shipping address model
│   └── Tests.swift           # Comprehensive test suite
├── main.swift                # Entry point and demo
└── README.md                 # This file

🛍️ CartItem

Represents a product in the cart with quantity tracking.

Properties:
    •    product: Product — The product
    •    quantity: Int — Number of items
    •    subtotal: Double — Calculated price (quantity × price)

Methods:
    •    updateQuantity(_:) — Update quantity to a specific value
    •    increaseQuantity(by:) — Increase quantity by amount

⸻

🧮 ShoppingCart

Main shopping cart with full item management.

Properties:
    •    items: [CartItem] — Array of cart items
    •    discountCode: String? — Optional discount code
    •    subtotal: Double — Total before discount
    •    discountAmount: Double — Calculated discount
    •    total: Double — Final total after discount
    •    itemCount: Int — Total number of items
    •    isEmpty: Bool — Check if cart is empty

Methods:
    •    addItem(_:) — Add product (auto-increments if exists)
    •    removeItem(_:) — Remove product by ID
    •    updateItemQuantity(productId:quantity:) — Update specific item quantity
    •    clearCart() — Remove all items

Discount Codes:
    •    SAVE10 — 10% off
    •    SAVE20 — 20% off

⸻

📦 Address

Shipping address with formatted output.

Properties:
    •    street: String
    •    city: String
    •    zipCode: String
    •    country: String
    •    formattedAddress: String — Multi-line formatted address

⸻

🧾 Order

Immutable snapshot of cart at checkout time.

Properties:
    •    orderId: String — Unique UUID
    •    items: [CartItem] — Snapshot of cart items
    •    subtotal: Double — Order subtotal
    •    discountAmount: Double — Applied discount
    •    total: Double — Final total
    •    timestamp: Date — Order creation time
    •    shippingAddress: Address — Delivery address
    •    itemCount: Int — Total items in order

⸻

🚀 Installation
    1.    Clone or download the project
    2.    Open in Xcode
    3.    Build and Run (⌘R)

Requirements:
    •    Swift 5.0+
    •    Xcode 12.0+
    •    macOS 10.15+

⸻

📝 Notes
    •    All prices must be positive (> 0)
    •    Product IDs should be unique
    •    Orders are immutable snapshots
    •    Cart automatically merges duplicate products
    •    Setting quantity to 0 removes the item

⸻

🎯 Key Concepts Demonstrated
    •    🧱 Struct vs Class — Value types for data models, reference type for cart
    •    ❓ Optionals — Failable initializers with validation
    •    🧮 Computed Properties — Dynamic calculations
    •    🧭 Enums — Type-safe categories
    •    🔒 Immutability — Order snapshots with let properties
    •    🔁 Array Operations — firstIndex, remove, append
    •    💲 String Formatting — Price display and address formatting
