//
//  ClosureFilterExamples.swift
//  Modern-SwiftUI-Bootcamp-Task-1
//
//  Created by Kürşat Şimşek on 22.08.2025.
//

import Foundation

// Closure kullanarak filtreleme ve sıralama örnekleri
struct ClosureFilterExamples {
    static func filterGreaterThanSeven(numbers: [Int]) -> [Int] {
        numbers.filter { $0 > 7 }
    }
    
    static func sortAscending(numbers: [Int]) -> [Int] {
        numbers.sorted { $0 < $1 }
    }
    
    static func demo() {
        let numbers = [20, 3, 8, 15, 2, 7, 16, 10]
        let filtered = filterGreaterThanSeven(numbers: numbers)
        let sorted = sortAscending(numbers: filtered)
        print("Original numbers:", numbers)
        print("Filtered (>7):", filtered)
        print("Sorted filtered:", sorted)
    }
}
