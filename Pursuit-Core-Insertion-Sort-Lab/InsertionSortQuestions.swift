import Foundation

// Question One
// Implement insertion sort that accepts a closure about how to sort elements
func insertionSorted<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var sortedArr = [T]()
    
    for element in arr {
        //uses the function right below this block
        sortedArr = insertElement(newElement: element, into: sortedArr, by: isSorted)
    }
    
    return sortedArr
}

func insertElement<T: Comparable>(newElement: T, into sortedArr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    var sortedArr = sortedArr
    
    for (index, element) in sortedArr.enumerated() {
        //insert the newElement at the index if newElement reaches a greater element
        //insert pushes all elements to its right, by one index
        if isSorted(newElement, element) {
            sortedArr.insert(newElement, at: index)
            return sortedArr
        }
    }
    //End of sortedArr reached without newElement being less than any other element in array
    //Must mean that the newElement is greater than all other elements, thus append to last index
    sortedArr.append(newElement)
    
    return sortedArr
}

// Question Two
// Sort an array of Ints using insertion sort without changing the position of any negative numbers
// https://www.geeksforgeeks.org/sort-an-array-without-changing-position-of-negative-numbers/
func insertionSortWithoutMovingNegatives<T: Comparable>(arr: [T], by isSorted: (T, T) -> Bool) -> [T] {
    let zero = 0 as! T
    let positiveArr = arr.filter { $0 >= zero }
    var sortedArr = [T]()
    
    for element in positiveArr {
        sortedArr = insertElement(newElement: element, into: sortedArr, by: isSorted)
    }
    
    for (index, element) in arr.enumerated() {
        //Got array with sorted positive numbers, now just inserting negative numbers to original indices
        if element < zero {
            sortedArr.insert(element, at: index)
        }
    }
    
    return sortedArr
}

// Question Three
// Implement insertion sort in place
func insertionSort<T: Comparable>(arr: inout [T], by isSorted: (T, T) -> Bool) -> [T] {
    for indexOne in 1..<arr.count {
        var indexTwo = indexOne
        //able to do indexTwo - 1 because count started at 1
        while indexTwo > 0 && !isSorted(arr[indexTwo - 1], arr[indexTwo]) {
            arr.swapAt(indexTwo - 1, indexTwo)
            indexTwo -= 1
        }
    }
    return arr
}

// Question Four
// Implement insertion sort on a linked list
func insertionSorted<T: Comparable>(list: LinkedList<T>, by isSorted: (T, T) -> Bool) -> LinkedList<T> {
    //make a new empty list, to be returned as the sorted list
    //find the node with the smallest value in the original list, then set it as the head of the new list
    //keep iterating through the original list to get smallest values of each iteration to be inserted to the new list
    return list
}

