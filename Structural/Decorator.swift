//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol carProtocol {
    var getSpeed:Double {get}
    func getDetails() -> String
}
 
 
class Car: carProtocol {
    
    var name:String
    var model:String
    var year:Int
 
    
   init(name:String,model:String,year:Int) {
    self.name = name
    self.model = model
    self.year = year
    }
    
    
    var getSpeed: Double {
        return 20.0
    }
    
    
    func getDetails() -> String {
        return "\(name) \(model) \(year)"
    }
    
}
 
 
class CarDecorator:carProtocol {
    
    private let decorator:carProtocol
    
    init(car:carProtocol) {
        self.decorator = car
    }
    
    var getSpeed: Double {
        return decorator.getSpeed + 10.0
    }
    
    var abs:Bool {
        return true
    }
    
    var ebs:Bool {
        return true
    }
    
    func getDetails() -> String {
        return "\(decorator.getDetails()) -- Decorator"
    }
    
    
}
 
 
let carObject = Car(name: "Opel", model: "Astra", year: 2017)
carObject.getDetails()
carObject.getSpeed // 20
 
let carDeco = CarDecorator(car: carObject)
carDeco.getSpeed // 30
carDeco.abs
