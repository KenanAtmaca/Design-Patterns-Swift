//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Shape { // #Component

    func draw()
}


class Square: Shape { // #Leaf
    
    var color:String
    
    init(_ color:String) {
        self.color = color
    }
    
    var width: CGFloat {
        return 100.0
    }
    
    var height: CGFloat {
        return 100.0
    }
    
    func draw() {
        print("Draw color:{\(color)}")
    }
    
    
}


class Oval: Shape { // #Leaf
    
    var color:String
    
    init(_ color:String) {
        self.color = color
    }
    
    var width: CGFloat {
        return 100.0
    }
    
    var height: CGFloat {
        return 100.0
    }
    
    func draw() {
        print("Draw color:{\(color)}")
    }

}


class Composite: Shape { // #Composite
    
    private var list:[Shape] = []
    
    init(_ elements:Shape...) {
        list = elements
    }
    
    func pushLeaf(_ item:Shape) {
        list.append(item)
    }
    
    func popLeaf() {
        list.removeLast()
    }
    
    var count:Int {
        return list.count
    }
    
    func draw() {
        for item in list {
            item.draw()
        }
    }
    
}

let obj = Composite(Square("#eee"),Square("#ffffff"),Oval("#f6f6f6"))
obj.pushLeaf(Square("#000000"))
obj.count // 4

obj.draw()
