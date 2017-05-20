//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol mathString {
    var getSum:String {get}
    var getMulti:String {get}
}

class Math {
    
    var x:Int
    var y:Int
    
    init(x:Int,y:Int) {
        self.x = x
        self.y = y
    }
    
    func sum() -> Int {
        return x + y
    }
    
    func multi() -> Int {
        return x * y
    }
    
}

class MathAdapter:mathString {
    
    private let mathTarget:Math!
    
    init(target:Math) {
        self.mathTarget = target
    }
    
    var getSum: String {
        return String(mathTarget.sum())
    }
    
    var getMulti: String {
        return String(mathTarget.multi())
    }
    
}

let obj = Math(x: 5, y: 9)
obj.sum()

let strFormat = MathAdapter(target: obj)
strFormat.getSum
