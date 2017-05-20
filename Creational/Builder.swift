//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Object {
    var width:Double? {get set}
    var height:Double? {get set}
    var color:String? {get set}
}

protocol ObjectBuilder {
    
    var object:Object {get set}
    
    func setWidth(width:Double?)
    func setHeight(height:Double?)
    func setColor(color:String?)
}

class Table: Object {
    
    var width: Double?
    var height: Double?
    var color: String?
    
}

class Builder: ObjectBuilder {
    
    var object: Object
    
    init(_ object:Object) {
        self.object = object
    }

    func setWidth(width: Double?) {
        object.width = width
    }
    
    func setHeight(height: Double?) {
        object.height = height
    }
    
    func setColor(color: String?) {
        object.color = color
    }
    
}

class Creator {
    
    var builder:ObjectBuilder
    
    init(_ builder:ObjectBuilder) {
        self.builder = builder
    }
    
    func build(width:Double?,height:Double?,color:String?) {
        builder.setWidth(width: width)
        builder.setHeight(height: height)
        builder.setColor(color: color)
    }
    
}


let builder = Builder(Table())
let creator = Creator(builder)

creator.build(width: 200, height: 200, color: nil)
creator.builder.object.width // 200
