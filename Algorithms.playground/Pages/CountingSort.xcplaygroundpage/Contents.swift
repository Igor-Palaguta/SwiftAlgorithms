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

let testArray = (1...1000).map { _ in Int(arc4random()) }

XCTAssert(testArray.countingSorted(min: 0, max: 100) == testArray.sorted())

//: [Radix Sort](RadixSort)
