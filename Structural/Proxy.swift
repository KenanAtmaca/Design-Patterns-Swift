//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol proxyProtocol {
    func download(_ site:String)
}

class Api: proxyProtocol {
    
    func download(_ site:String) {
        print("Download file %100 ... \(site)")
    }
    
}

class ApiProxy : proxyProtocol {
    
    private var api:Api!
    
    func auth(_ token: String) -> Bool {
        
        guard token == "XXX" else {
            return false
        }
        
        api = Api()
        
        return true
    }
    
    func download(_ site:String) {
        
        if api != nil {
            api.download(site)
        } else {
            print("@ Error Access Api Token")
        }
        
    }
    
}

let obj = ApiProxy()
obj.download("http://img.com/pwqr3") // Error

obj.auth("XXX")
obj.download("http://img.com/pwqr3") // Download
