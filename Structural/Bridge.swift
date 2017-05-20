//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Decoder {
    func decode()
}


class JSON: Decoder {
    func decode() {
        print("{JSON Decode}")
    }
}

class XML: Decoder {
    func decode() {
        print("<XML Decode>")
    }
}


class Bridge {
    private var format:Decoder
    
    init(_ format:Decoder) {
        self.format = format
    }
    
    func decodeProcess(){
        format.decode()
    }
}


class Web: Bridge {
    override init(_ format: Decoder) {
        super.init(format)
    }
    
    override func decodeProcess() {
        print("Web decode")
        super.decodeProcess()
    }
}

class Mobile: Bridge {
    override init(_ format: Decoder) {
        super.init(format)
    }
    
    override func decodeProcess() {
        print("Mobile decode")
        super.decodeProcess()
    }
}


let web = Web(JSON())
web.decodeProcess() // {JSON Decode}

let mobile = Mobile(XML())
mobile.decodeProcess() // <XML Decode>
