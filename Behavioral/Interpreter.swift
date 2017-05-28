//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//


class Context {
    var text:String?
    var ascii:String?
}

protocol TerminalExpression {
    func interpret(_ context:Context)
    func converter(_ str:String) -> String
}

class asciiExp: TerminalExpression {
    
    func interpret(_ context: Context) {
        
        guard context.text != nil else {
            return
        }
        
        context.ascii = self.converter(context.text!)
    }
    
    func converter(_ str: String) -> String {
        var asciiSet:[String] = []
        
        str.unicodeScalars.map { (u) in
            asciiSet.append(String(u.value))
        }
        
        return asciiSet.joined()
    }
    
}

var context = Context()
context.text = "KENAN"

let ascii = asciiExp()

ascii.interpret(context)

context.ascii // 7569786578
