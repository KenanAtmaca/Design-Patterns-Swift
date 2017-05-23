
//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol UserSetup {
    var nick:String? {get set}
    var pass:String? {get set}
    var age:Int? {get set}
    var gender:String? {get set}
}

class UserTemp:UserSetup {
    
    var nick: String?
    var pass: String?
    var age: Int?
    var gender: String?
    
}

class User:UserSetup {
    
    var nick:String?
    var pass:String?
    var age:Int?
    var gender:String?
    
    
    func backUp() -> UserTemp {
        let tmpUser = UserTemp()
        tmpUser.nick = nick
        tmpUser.age = age
        tmpUser.pass = pass
        tmpUser.gender = gender
        
        return tmpUser
    }
    
    func getBackUp(_ tmp:UserTemp) {
        self.nick = tmp.nick
        self.pass = tmp.pass
        self.age = tmp.age
        self.gender = tmp.gender
    }
    
}

class BackUp {
    var tmp:UserTemp?
}


let user = User()
user.nick = "Kenan"
user.age = 22
user.pass = "000000"
user.gender = "Male"

let backup = BackUp()

backup.tmp = user.backUp()

user.pass = "999999"

user.pass // 999999

user.getBackUp(backup.tmp!)

user.pass // 000000
