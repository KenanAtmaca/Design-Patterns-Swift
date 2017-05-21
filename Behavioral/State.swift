//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol UserState {
    func handle(_ context: UserContext)
}


class Normal: UserState {
    func handle(_ context: UserContext) {
        
        print("Normal User Point:\(context.point)")
    }
}

class Gold: UserState {
    func handle(_ context: UserContext) {
 
        print("Gold User Activ.!!! Point:\(context.point)")
    }
}

class Platinium: UserState {
    func handle(_ context: UserContext) {
        print("Platinium User Activ.!!! Point:\(context.point)")
    }
}

class UserContext {
    
    var point:Int = 0
    
    private var _state:UserState
    
    var state:UserState {
        get {
            return self._state
        }
        set {
            self._state = newValue
            self._state.handle(self)
        }
    }
  
    init() {
        _state = Normal()
        _state.handle(self)
    }
    
    
    func addPoint() {
        point = point + 5
        controlPoint()
    }
    
    func controlPoint() {
        
        if point >= 20 {
            self.state = Platinium()
        } else if point >= 10 {
            self.state = Gold()
        }
    }
}

let context = UserContext()

context.addPoint() // Normal user
context.addPoint() // Gold user
context.addPoint() // Gold user
context.addPoint() // Platinium user
