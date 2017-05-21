//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol ObserverProtocol: class {
    func update(_ value:Int)
}


class TestObserver {
    
    weak var observer:ObserverProtocol?
    
    var point:Int = 0 {
        willSet {
            observer?.update(newValue)
        }
    }
    
}

class Observer: ObserverProtocol {
    
    func update(_ value: Int) {
        if value % 2 == 0 {
            print("Even")
        } else {
            print("Odd")
        }
    }
    
}

let observer = Observer()

let testObs = TestObserver()
testObs.observer = observer

testObs.point += 1
testObs.point += 1
