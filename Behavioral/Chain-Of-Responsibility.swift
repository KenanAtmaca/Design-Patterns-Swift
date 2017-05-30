//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Player {
    
    func play(_ path:String)
    var nextPlayer:Player? {get set}
    
}

class MP3Player: Player {
    
    var nextPlayer: Player?
    
    func play(_ path: String) {
        
        if path.components(separatedBy: ".")[1] == "mp3" {
            print("Play song - \(path)")
        } else {
            
            if nextPlayer != nil {
                nextPlayer?.play(path)
            }
        }
        
    }
    
}

class WAVPlayer: Player {
    
    var nextPlayer: Player?
    
    func play(_ path: String) {
        
        if path.components(separatedBy: ".")[1] == "wav" {
            print("Play song - \(path)")
        } else {
            
            print("Error type")
        }
        
    }
}


let mp3Obj = MP3Player()
let wavObj = WAVPlayer()

mp3Obj.nextPlayer = wavObj

mp3Obj.play("letmego.mp3") // Play song - letmego.mp3
