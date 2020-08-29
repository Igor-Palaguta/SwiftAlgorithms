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

let testArray = (1...1000).map { _ in arc4random() }

XCTAssert(testArray.mergeSorted() == testArray.sorted())
XCTAssert(testArray.mergeSorted(by: >) == testArray.sorted(by: >))

//: [Quick Sort](QuickSort)
