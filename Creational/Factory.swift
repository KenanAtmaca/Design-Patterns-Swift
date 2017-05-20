//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

enum Worker {
    case student
    case teacher
}

protocol School {
    var name:String? {get set}
    var no:Int? {get set}
    func say()
}

class Student: School {
    
    var name: String?
    var no: Int?
    
    func say() {
        print("I am Student")
    }
}

class Teacher: School {
    var name: String?
    var no: Int?
    
    func say() {
        print("I am Teacher")
    }
}


class Factory {
    
    var worker:Worker
    
    init(_ worker: Worker) {
        self.worker = worker
    }
    
    func create() -> School {
        
        switch worker {
        case .student:
           return Student()
        case .teacher:
            return Teacher()
        }
        
    }
}


var obj = Factory(.student).create()

obj.name = "Kenan"
obj.no = 2194014
obj.say() // I am Student

var obj2 = Factory(.teacher).create()

obj2.name = "David"
obj2.no = 982342
obj2.say() // I am Teacher
