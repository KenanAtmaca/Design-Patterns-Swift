//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Server {
    func connect()
}

class Mysql: Server {
    func connect() {
        print("Connected Mysql.")
    }
}

class MangoDb: Server {
    func connect() {
        print("Connected MangoDB.")
    }
}


protocol Decode {
    func decode()
}

class JSON: Decode {
    func decode() {
        print("JSON Decode")
    }
}

class XML: Decode {
    func decode() {
        print("XML Decode")
    }
}

protocol AbstractFactory {
    func getConnect(type:String) -> Server?
    func getDecode(type:String) -> Decode?
}


class Factory: AbstractFactory {
    
    
    func getConnect(type: String) -> Server? {
        if type == "mysql" {
            return Mysql()
        } else if type == "mango" {
            return MangoDb()
        } else {
            return nil
        }
    }
    
    func getDecode(type: String) -> Decode? {
        if type == "json" {
            return JSON()
        } else if type == "xml" {
            return XML()
        } else {
            return nil
        }
    }
    
}

let factory = Factory()

let server = factory.getConnect(type: "mysql")
let decode = factory.getDecode(type: "json")

server?.connect()
decode?.decode()
