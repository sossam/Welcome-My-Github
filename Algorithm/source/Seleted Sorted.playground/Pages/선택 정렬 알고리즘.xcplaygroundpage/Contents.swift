
import Foundation

//var arr = [80, 75, 10, 60, 15, 49, 12, 25]
/*
for i in 0..<arr.count {
    var minIndex: Int = i
    
    for j in i+1..<arr.count {
        if arr[minIndex] > arr[j] {
            minIndex = j
        }
    }
    
    if i != minIndex {
        arr.swapAt(i, minIndex)
    }
}

print(arr)
 */

func selectedSort<T: Comparable>(_ a: [T], order: Bool) -> [T] {
    var arr: [T] = a
    
    for i in 0..<arr.count {
        var changedIndex: Int = i
        
        for j in i+1..<arr.count {
            switch order {
            case true:
                if arr[changedIndex] > arr[j] {
                    changedIndex = j
                }
            default:
                if arr[changedIndex] < arr[j] {
                    changedIndex = j
                }
            }
        }
        
        if i != changedIndex {
            arr.swapAt(i, changedIndex)
        }
    }
    
    return arr
}

var arr: [Int] = [80, 64, 13, 25, 10, 70, 49]
print(selectedSort(arr, order: true))
print(selectedSort(arr, order: false))


