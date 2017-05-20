//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Cloneable: class {
    associatedtype T
    func clone() -> T
}

class Product: Cloneable {
    
    typealias T = Product
    
    var name:String
    var description:String
    var price:Double
    
    init(name:String,description:String,price:Double) {
        self.name = name
        self.description = description
        self.price = price
    }
    
    func clone() -> Product {
        return Product(name: name, description: description, price: price)
    }
    
}


let obj_1 = Product(name: "Apple", description: "Green Apple", price: 2.0)

let obj_2 = obj_1.clone()

obj_2.name // Apple

obj_2.price = 4.6

obj_2.price // 4.6
