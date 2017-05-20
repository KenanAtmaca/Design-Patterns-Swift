//
//  Created by Kenan Atmaca
//  kenanatmaca.com
//

protocol Sortable {
    func sort(_ array:[Int]) -> [Int]
}


class Math {
    
    private var sortable:Sortable
    
    init(_ sorted:Sortable) {
        self.sortable = sorted
    }
    
    func sort(_ array:[Int]) -> [Int] {
        return sortable.sort(array)
    }
    
}

final class BubbleSort: Sortable {
    func sort(_ array: [Int]) -> [Int] {
        print("Bubble Sort Algorithm Selected")
        return array
    }
}

final class MergeSort: Sortable {
    func sort(_ array: [Int]) -> [Int] {
        print("Merge Sort Algorithm Selected")
        return array
    }
}


var obj = Math(BubbleSort())
obj.sort([1,2,3]) // Bubble Sort Selected

obj = Math(MergeSort())

obj.sort([4,5,6,7,8]) // Merge Sort Selected
