import Foundation

// inout means that the arguments can be changed inside the function
// If not, they will be treated as immutable
func bubbleSort(list: inout [Int]) -> [Int] {
    let length = list.count
    
    // Loop over entire list
    for (index, _) in list.enumerated() {
        // loop over list to bring largest element to the end of current array spread
        
        for y in 0..<length-index-1  {
            let left = list[y]
            let right = list[y + 1]
            // Swap elements if they're not in correct order
            if(left > right) {
                list[y+1] = left
                list[y] = right
            }
        }
    }
    
    return list
}

var testArr:[Int] = [7, 54, 21, 1, 3, 6, 2, 0, 6, -1, 8]
bubbleSort(list: &testArr)
