//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//


protocol DoorExecute {
    func execute()
    var doorName:String {get set}
}

class DoorOpen: DoorExecute {
    
    var doorName: String
    
    init(name:String) {
        self.doorName = name
    }
    
    func execute() {
        
        print("Opened door {\(self.doorName)}")
    }
    
}

class DoorClose: DoorExecute {
    
    var doorName: String
    
    init(name:String) {
        self.doorName = name
    }
    
    func execute() {
        print("Closed door {\(self.doorName)}")
    }
    
}

class Door {
    
    private var doorOpen:DoorExecute
    private var doorClose:DoorExecute

    init(name:String) {
        doorOpen = DoorOpen(name: name)
        doorClose = DoorClose(name: name)
    }
    
    func open() {
        doorOpen.execute()
    }
    
    func close() {
        doorClose.execute()
    }
    
}

let door = Door(name: "A Block")

door.open()
door.close()
