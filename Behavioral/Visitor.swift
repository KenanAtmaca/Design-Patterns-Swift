//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol PhoneVisitor {
    
    func visit(_ model:Iphone7)
    func visit(_ model:Iphone6)
    
}

protocol Phone {
    func call(str:String)
    func addModule(_ module:PhoneVisitor)
}

class Touch3D: PhoneVisitor {
    func visit(_ model: Iphone6) {
        print("İphone 6 not support 3D touch")
    }
    
    func visit(_ model: Iphone7) {
         print("İphone 7 support 3D touch")
    }
}

class DoubleCamera: PhoneVisitor {
    func visit(_ model: Iphone7) {
        print("Double Camera")
    }
    
    func visit(_ model: Iphone6) {
        print("One camera")
    }
}

class Iphone7: Phone {
    
    func call(str: String) {
        print("Call \(str) ...")
    }
    
    func addModule(_ module: PhoneVisitor) {
        module.visit(self)
    }
    
}

class Iphone6: Phone {
    
    func call(str: String) {
        print("Call \(str) ...")
    }
    
    func addModule(_ module: PhoneVisitor) {
        module.visit(self)
    }
    
}


let iphone_7 = Iphone7()
iphone_7.call(str: "+90 521 256 21 67")

let iphone_6 = Iphone6()

let touchModule = Touch3D()
let cameraModule = DoubleCamera()

iphone_6.addModule(touchModule) // Not support

iphone_7.addModule(cameraModule) // Double Camera
