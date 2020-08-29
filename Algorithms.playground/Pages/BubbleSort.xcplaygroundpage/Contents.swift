/*:

 # Bubble Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int {
    mutating func bubbleSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in 0..<(count - 1) {
            for j in 0..<(count - i - 1) {
                if areInIncreasingOrder(self[j + 1], self[j]) {
                    (self[j], self[j + 1]) = (self[j + 1], self[j])
                }
            }
        }
    }

    func bubbleSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.bubbleSort(by: areInIncreasingOrder)
        return result
    }
}

extension MutableCollection where Element: Comparable, Index == Int {
    mutating func bubbleSort() {
        bubbleSort(by: <)
    }

    func bubbleSorted() -> [Element] {
        return bubbleSorted(by: <)
    }
}

let testArray = (1...1000).map { _ in arc4random() }

XCTAssert(testArray.bubbleSorted() == testArray.sorted())
XCTAssert(testArray.bubbleSorted(by: >) == testArray.sorted(by: >))

//: [Selection Sort](SelectionSort)
