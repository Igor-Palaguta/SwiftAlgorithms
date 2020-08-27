//: [Merge Sort](MergeSort)

/*:

 # Quick Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int, Self: RangeReplaceableCollection {
    mutating func quickSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        guard count > 1 else {
            return
        }

        var pivotIndex = startIndex

        let sliceEndIndex = startIndex + count

        for i in (startIndex + 1)..<sliceEndIndex {
            if areInIncreasingOrder(self[i], self[pivotIndex]) {
                insert(remove(at: i), at: pivotIndex)
                pivotIndex += 1
            }
        }

        self[startIndex..<pivotIndex].quickSort(by: areInIncreasingOrder)
        self[(pivotIndex + 1)..<sliceEndIndex].quickSort(by: areInIncreasingOrder)
    }

    func quickSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.quickSort(by: areInIncreasingOrder)
        return result
    }
}

extension MutableCollection where Element: Comparable, Index == Int, Self: RangeReplaceableCollection {
    mutating func quickSort() {
        quickSort(by: <)
    }

    func quickSorted() -> [Element] {
        return quickSorted(by: <)
    }
}

let testArray = [87, 4, 29, 20, 50, 52, 69, 5, 10, 16, 41, 30, 64, 83, 43, 77, 9, 28, 25, 23, 51, 13, 66, 58, 7, 35, 11, 78, 27, 97]

XCTAssert(testArray.quickSorted() == testArray.sorted())
XCTAssert(testArray.quickSorted(by: >) == testArray.sorted(by: >))

//: [Heap Sort](HeapSort)
