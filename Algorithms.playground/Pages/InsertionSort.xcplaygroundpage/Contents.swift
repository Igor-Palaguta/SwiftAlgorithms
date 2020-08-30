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
                    swapAt(currentIndex, j)
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

let testArray = (1...1000).map { _ in arc4random() }

XCTAssert(testArray.insertionSorted() == testArray.sorted())
XCTAssert(testArray.insertionSorted(by: >) == testArray.sorted(by: >))

//: [Merge Sort](MergeSort)
