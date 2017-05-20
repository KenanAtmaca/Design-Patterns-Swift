//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol ShopingProtocol {
    var description:String {get set}
    var item:String {get set}
}


final class Shoping: ShopingProtocol {
    
    var description:String
    var item:String
    
    init(description:String,item:String) {
        self.description = description
        self.item = item
    }
    
}

class Todo {
    
    private var shopingList:[Int:Shoping] = [:]
    
    func add(item:String,description:String,index:Int) -> Shoping? {
        
        if shopingList.index(forKey: index) == nil {
            shopingList[index] = Shoping(description: description, item: item)
        }
        
        return shopingList[index]
    }
    
    func list() {
        for (key,value) in shopingList.enumerated() {
            print("\(key) -- \(value.value.item)")
        }
    }

}

let obj = Todo()

obj.add(item: "Süt", description: "Tam tağlı", index: 0)
obj.add(item: "Elma", description: "Yeşil", index: 1)
obj.add(item: "Çikolata", description: "Sütlü", index: 2)

let dd = obj.add(item: "Tuz", description: "Kaya", index: 1)
dd?.item // Elma

obj.list()
