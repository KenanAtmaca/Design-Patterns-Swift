//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

class Singleton {
    
    
    static var shared = Singleton()
    
    
    private init() {
        // setup codes
        
        viewSetup()
        
    }
    
    func viewSetup() {
        //
        print("ok...")
    }
    
    
}
 
 
var obj = Singleton.shared
