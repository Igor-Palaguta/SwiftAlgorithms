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

let testArray = (1...1000).map { _ in arc4random() }

XCTAssert(testArray.selectionSorted() == testArray.sorted())
XCTAssert(testArray.selectionSorted(by: >) == testArray.sorted(by: >))

//: [Insertion Sort](InsertionSort)
