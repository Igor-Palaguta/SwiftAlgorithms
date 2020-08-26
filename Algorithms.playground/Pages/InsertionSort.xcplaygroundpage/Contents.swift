//: [Selection Sort](SelectionSort)

/*:

 # Insertion Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int {
    mutating func insertionSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in 1..<count {
            var currentIndex = i
            for j in stride(from: i - 1, through: 0, by: -1) {
                if areInIncreasingOrder(self[currentIndex], self[j]) {
                    (self[currentIndex], self[j]) = (self[j], self[currentIndex])
                    currentIndex = j
                }
            }
        }
    }

    func insertionSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.insertionSort(by: areInIncreasingOrder)
        return result
    }
}

extension MutableCollection where Element: Comparable, Index == Int {
    mutating func insertionSort() {
        insertionSort(by: <)
    }

    func insertionSorted() -> [Element] {
        return insertionSorted(by: <)
    }
}

let testArray = [87, 4, 29, 20, 50, 52, 69, 5, 10, 16, 41, 30, 64, 83, 43, 77, 9, 28, 25, 23, 51, 13, 66, 58, 7, 35, 11, 78, 27, 97]

XCTAssert(testArray.insertionSorted() == testArray.sorted())
XCTAssert(testArray.insertionSorted(by: >) == testArray.sorted(by: >))

//: [Merge Sort](MergeSort)
