import Foundation
struct CartItem {
    let product: Product
    var quantity: Int
    var subtotal: Double {
        Double(quantity) * product.price
    }
    
    mutating func updateQuantity(_ newQuantity: Int){
        if newQuantity >= 0 {
            quantity = newQuantity
        } else {
            print("Exepction")
        }
    }
        
    mutating func increaseQuantity(by amount: Int) {
        if amount >= 0{
            quantity += amount
        }
    }
}
