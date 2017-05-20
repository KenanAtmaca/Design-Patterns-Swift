//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

class Query {
    
    class func check() {
        print("checked")
    }
    
    class func insert() {
        print("Insert")
    }
    
    class func query() {
        print("Fetch")
    }

}

class Register {
    
    func registerUser(nick:String,pass:String) {
        Query.check()
        Query.insert()
        print("Register Complate")
    }
}

class Login {
    
    func loginUser() {
        Query.query()
        print("Login user...")
    }
    
}

class FacadeSys {
    
    private var nick:String
    private var pass:String
    
    private var rregister:Register
    private var llogin:Login
    
    init(nick:String,pass:String) {
        
        self.nick = nick
        self.pass = pass
        
        rregister = Register()
        llogin = Login()
        
    }
    
    func register() {
        self.rregister.registerUser(nick: self.nick, pass: self.pass)
    }
    
    func login() {
        self.llogin.loginUser()
    }
    
}


let obj = FacadeSys(nick: "Kenan", pass: "000000")
obj.register()
print("---")
obj.login()
