import Foundation

func mergeSort(_ list: [Int]) -> [Int] {
    if list.count <= 1 {
        return list
    }
    
    var lList: [Int] = []
    var rList: [Int] = []
    
    let mid = list.count / 2
    lList += list[0..<mid]
    rList += list[mid..<list.count]
    
    let left = mergeSort(lList)
    let right = mergeSort(rList)
    
    return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftArr = left
    var rightArr = right
    var result: [Int] = []
    
    while !leftArr.isEmpty && !rightArr.isEmpty {
        let value = leftArr[0] < rightArr[0] ? leftArr.remove(at: 0) : rightArr.remove(at: 0)
        result += [value]
    }
    if !left.isEmpty {
        result += leftArr
    }
    if !right.isEmpty {
        result += rightArr
    }
    return result
}

var arr: [Int] = [80, 64, 13, 25, 10, 70, 49]
print(mergeSort(arr))


func mergetest(_ list: [Int]) -> [Int] {
    if list.count <= 1 {
        return list
    }
    var mid = list.count / 2
    var lList = list.index(where:  { (num) -> Bool in
        
        num==mid
    })
    
    print(lList)
    
    return list
}

mergetest(arr)





