import Foundation

func quickSort(arr: [Int], start: Int, end: Int) -> [Int] {
    var sorted: [Int] = arr
    
    if start < end {
        let tuple = partitionQuickSort(arr: sorted, start: start, end: end)
        let pivot = tuple.0
        
        sorted = tuple.1
        sorted = quickSort(arr: sorted, start: start, end: pivot - 1)
        sorted = quickSort(arr: sorted, start: pivot + 1, end: end)
    }
    return sorted
}

func partitionQuickSort(arr: [Int], start: Int, end: Int) -> (Int, [Int]) {
    var sorted: [Int] = arr
    let pivot = end
    var right = end
    var left = start
    
    while (left < right) {
        while((sorted[pivot] > sorted[left]) && (left < right)) {
            left += 1
        }
        
        while((sorted[pivot] <= sorted[right]) && (left < right)) {
            right -= 1
        }
        
        if left < right {
            sorted.swapAt(left, right)
        }
    }
    sorted.swapAt(right, pivot)
    
    return (right, sorted)
}

var arr: [Int] = [80, 75, 10, 60, 15, 49, 12, 25]
print(quickSort(arr: arr, start: 0, end: arr.count - 1))






