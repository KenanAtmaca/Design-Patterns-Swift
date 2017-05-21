//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol ObserveProtocol: class {
    func update(_ value:Int)
}


class TestObserve {
    
    weak var observe:ObserveProtocol?
    
    var point:Int = 0 {
        willSet {
            observe?.update(newValue)
        }
    }
    
}

class Observe: ObserveProtocol {
    
    func update(_ value: Int) {
        if value % 2 == 0 {
            print("Even")
        } else {
            print("Odd")
        }
    }
    
}

let observe = Observe()

let testObs = TestObserve()
testObs.observe = observe

testObs.point += 1
testObs.point += 1
