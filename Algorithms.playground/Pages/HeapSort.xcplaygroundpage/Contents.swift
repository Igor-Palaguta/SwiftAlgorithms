//: [Quick Sort](QuickSort)

/*:

 # Heap Sort
 https://www.geeksforgeeks.org/heap-sort/

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int, Self: RangeReplaceableCollection {
    mutating func heapSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        heapify(by: areInIncreasingOrder)

        for i in stride(from: count - 1, through: 0, by: -1) {
            swapAt(0, i)
            heapifySubtree(at: 0, endIndex: i, by: areInIncreasingOrder)
        }
    }

    func heapSorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.heapSort(by: areInIncreasingOrder)
        return result
    }

    mutating func heapify(by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in stride(from: Int(count / 2) - 1, through: 0, by: -1) {
            heapifySubtree(at: i, endIndex: endIndex, by: areInIncreasingOrder)
        }
    }

    func heapified(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result = Array(self)
        result.heapify(by: areInIncreasingOrder)
        return result
    }

    private mutating func heapifySubtree(at index: Int, endIndex: Index, by areInIncreasingOrder: (Element, Element) -> Bool) {
        var largestIndex = index

        let leftIndex = 2 * index + 1
        let rightIndex = 2 * index + 2

        if leftIndex < endIndex && areInIncreasingOrder(self[largestIndex], self[leftIndex]) {
            largestIndex = leftIndex
        }

        if rightIndex < endIndex && areInIncreasingOrder(self[largestIndex], self[rightIndex]) {
            largestIndex = rightIndex
        }

        if largestIndex == index {
            return
        }

        swapAt(index, largestIndex)
        heapifySubtree(at: largestIndex, endIndex: endIndex, by: areInIncreasingOrder)
    }
}

extension MutableCollection where Element: Comparable, Index == Int, Self: RangeReplaceableCollection {
    mutating func heapSort() {
        heapSort(by: <)
    }

    func heapSorted() -> [Element] {
        return heapSorted(by: <)
    }
}

let testArray = (1...1000).map { _ in arc4random() }

XCTAssert(testArray.heapSorted() == testArray.sorted())
XCTAssert(testArray.heapSorted(by: >) == testArray.sorted(by: >))

//: [Counting Sort](CountingSort)
