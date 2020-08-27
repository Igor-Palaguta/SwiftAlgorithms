//: [Heap Sort](HeapSort)

/*:

 # Counting Sort

*/

import Foundation
import XCTest

extension MutableCollection where Index == Int, Element == Int {
    func countingSorted(min: Element, max: Element) -> [Element] {
        var counts = Array(repeating: 0, count: max - min + 1)
        forEach { element in
            counts[element - min] += 1
        }

        var result: [Int] = []
        result.reserveCapacity(count)

        for i in 0..<counts.count where counts[i] > 0 {
            result.append(contentsOf: Array(repeating: i + min, count: counts[i]))
        }

        return result
    }
}

let testArray = [87, 4, 29, 20, 50, 52, 69, 5, 10, 16, 41, 30, 64, 83, 43, 77, 9, 28, 25, 23, 51, 13, 66, 58, 7, 35, 11, 78, 27, 97]

XCTAssert(testArray.countingSorted(min: 0, max: 100) == testArray.sorted())
