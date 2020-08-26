//: [Insertion Sort](InsertionSort)

/*:

 # Merge Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int, Self: RangeReplaceableCollection {
    mutating func mergeSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        guard count > 1 else {
            return
        }

        let sliceEndIndex = startIndex + count
        let middleIndex = startIndex + Int(count / 2)

        self[startIndex..<middleIndex].mergeSort(by: areInIncreasingOrder)
        self[middleIndex..<sliceEndIndex].mergeSort(by: areInIncreasingOrder)

        var leftIndex = startIndex
        var rightIndex = middleIndex
        var leftEndIndex = middleIndex

        while leftIndex < leftEndIndex && rightIndex < sliceEndIndex {
            let left = self[leftIndex]
            let right = self[rightIndex]

            if areInIncreasingOrder(right, left) {
                insert(remove(at: rightIndex), at: leftIndex)
                rightIndex += 1
                leftEndIndex += 1
            }

            leftIndex += 1
        }
    }

    func mergeSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.mergeSort(by: areInIncreasingOrder)
        return result
    }
}

extension MutableCollection where Element: Comparable, Index == Int, Self: RangeReplaceableCollection {
    mutating func mergeSort() {
        mergeSort(by: <)
    }

    func mergeSorted() -> [Element] {
        return mergeSorted(by: <)
    }
}

let testArray = [87, 4, 29, 20, 50, 52, 69, 5, 10, 16, 41, 30, 64, 83, 43, 77, 9, 28, 25, 23, 51, 13, 66, 58, 7, 35, 11, 78, 27, 97]

XCTAssert(testArray.mergeSorted() == testArray.sorted())
XCTAssert(testArray.mergeSorted(by: >) == testArray.sorted(by: >))

//: [Quick Sort](QuickSort)
