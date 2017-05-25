//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

class Human {
    var name:String
    var surname:String
    
    init(name:String,surname:String) {
        self.name = name
        self.surname = surname
    }
}

protocol HumanIterator {
    func next() -> Human?
    func curentItem() -> Human?
    func isDone() -> Bool
    var count:Int {get}
}

protocol Aggregate {
    func getIterator() -> HumanIterator
    func getItem(_ index:Int) -> Human
}

class HumanAggregate: Aggregate {
    
    private var list:[Human] = []
    
    var count:Int {
        return list.count
    }
    
    func add(_ h:Human) {
        list.append(h)
    }
    
    func pop() {
        if count > 0 {
            list.removeLast()
        }
    }
    
    func getItem(_ index:Int) -> Human {
        return list[index]
    }
    
    func getIterator() -> HumanIterator {
        return Iterator(self)
    }
    
    
}

class Iterator: HumanIterator {
    
    private var list:HumanAggregate
    
    var index:Int = 0
    
    var count:Int {
        return list.count
    }
    
    init(_ list:HumanAggregate) {
        self.list = list
    }
    
    func next() -> Human? {
        
        defer {
             index = index + 1
        }
        
        return isDone() ? list.getItem(index) : nil
    }
    
    func curentItem() -> Human? {
        return list.getItem(index)
    }
    
    func isDone() -> Bool {
        return index < count
    }
    
}


let hum = HumanAggregate()

hum.add(Human(name: "Kenan", surname: "Atmaca"))
hum.add(Human(name: "John", surname: "Wick"))
hum.add(Human(name: "David", surname: "Cop"))

let makeIterator = hum.getIterator()

while makeIterator.isDone() {
    print((makeIterator.curentItem()?.name)!)
    makeIterator.next()
}
