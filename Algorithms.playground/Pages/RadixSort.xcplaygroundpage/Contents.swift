//: [Counting Sort](CountingSort)

/*:

 # Radix Sort

 */

import Foundation
import XCTest

extension MutableCollection where Index == Int, Element == Int {
    func radixSorted(radix: Int = 10) -> [Element] {
        guard let max = self.max() else {
            return []
        }

        var result = Array(self)

        for exp in sequence(first: 1, next: { $0 * radix }).prefix(while: { $0 <= max }) {
            var buckets: [[Element]] = Array(repeating: [], count: radix)

            for element in result {
                let bucketIndex = (element / exp) % radix
                buckets[bucketIndex].append(element)
            }

            result = buckets.flatMap { $0 }
        }

        return result
    }
}

let testArray = (1...1000).map { _ in Int(arc4random()) }

XCTAssert(testArray.radixSorted(radix: 2) == testArray.sorted())
