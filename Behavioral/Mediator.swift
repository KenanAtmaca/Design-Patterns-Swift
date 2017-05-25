//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//


protocol MessageProtocol {
    func send(_ message:String)
}

class User {
    
    var nick:String
    
    init(nick:String) {
        self.nick = nick
    }
    
    func messageSend(_ text:String) {
        print("\(nick) -- send message: \(text)")
    }
    
}

class MessageMediator: MessageProtocol {
    
    var msgUsers:[User] = []
    
    func add(_ user:User) {
        msgUsers.append(user)
    }
    
    func send(_ message: String) {
        for msg in msgUsers {
            msg.messageSend(message)
        }
    }
}

class MessageSender {
    class func sender(_ msg:String, mediator:MessageMediator) {
        mediator.send(msg)
    }
}

let user_1 = User(nick: "uikenan")
let user_2 = User(nick: "dreamer")

let messageMediator = MessageMediator()

messageMediator.add(user_1)
messageMediator.add(user_2)

MessageSender.sender("Hii users!", mediator: messageMediator)
