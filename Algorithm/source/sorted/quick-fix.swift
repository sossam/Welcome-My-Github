
import Foundation

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

func quicksort<T: Comparable>(_ a: [T], _ order: Bool) -> [T]{
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count / 2]
    var before: [T]
    var equal: [T]
    var after: [T]
    switch order {
    case true:
        before = a.filter { $0 < pivot }
        equal = a.filter { $0 == pivot }
        after = a.filter { $0 > pivot }
        
    default:
        before = a.filter { $0 > pivot }
        equal = a.filter { $0 == pivot }
        after = a.filter { $0 < pivot }
    }
    
    return quicksort(before, order) + equal + quicksort(after, order)
}

var arr: [Int] = [80, 64, 13, 25, 10, 70, 49]
print(quicksort(arr, false))



