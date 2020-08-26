//: [Bubble Sort](BubbleSort)

/*:

 # Selection Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int {
    mutating func selectionSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in 0..<count {
            var minIndex = i
            for j in (i + 1)..<count {
                if areInIncreasingOrder(self[j], self[minIndex]) {
                    minIndex = j
                }
            }
            if minIndex != i {
                (self[minIndex], self[i]) = (self[i], self[minIndex])
            }
        }
    }

    func selectionSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.selectionSort(by: areInIncreasingOrder)
        return result
    }
}

extension MutableCollection where Element: Comparable, Index == Int {
    mutating func selectionSort() {
        selectionSort(by: <)
    }

    func selectionSorted() -> [Element] {
        return selectionSorted(by: <)
    }
}

let testArray = [87, 4, 29, 20, 50, 52, 69, 5, 10, 16, 41, 30, 64, 83, 43, 77, 9, 28, 25, 23, 51, 13, 66, 58, 7, 35, 11, 78, 27, 97]

XCTAssert(testArray.selectionSorted() == testArray.sorted())
XCTAssert(testArray.selectionSorted(by: >) == testArray.sorted(by: >))

//: [Insertion Sort](InsertionSort)
