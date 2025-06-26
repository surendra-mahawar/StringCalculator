//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import Foundation

enum NegativeNumberError: LocalizedError {
    case negativesFound([Int])
    
    var errorDescription: String? {
        switch self {
        case .negativesFound(let numbers):
            return "Negative numbers not allowed: " + numbers.map(String.init).joined(separator: ", ")
        }
    }
}

struct StringCalculator {
    
    func add(_ input: String) throws -> Int {
        let (delimiters, numbersPart) = extractDelimitersAndInput(from: input)
        let numbers = try parseNumbers(from: numbersPart, using: delimiters)
        return numbers.reduce(0, +)
    }
    
    // MARK: - Helpers
    
    private func extractDelimitersAndInput(from input: String) -> ([String], String) {
        var delimiters = [",", "\n"]
        var numbersPart = input
        
        if input.hasPrefix("//") {
            let lines = input.components(separatedBy: "\n")
            if let delimiterLine = lines.first {
                let delimiter = String(delimiterLine.dropFirst(2))
                delimiters = [delimiter]
                numbersPart = lines.dropFirst().joined(separator: "\n")
            }
        }
        
        return (delimiters, numbersPart)
    }
    
    private func parseNumbers(from input: String, using delimiters: [String]) throws -> [Int] {
        var modifiedInput = input
        for delimiter in delimiters {
            modifiedInput = modifiedInput.replacingOccurrences(of: delimiter, with: ",")
        }
        
        let parts = modifiedInput
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
        
        let numbers = parts.compactMap(Int.init)
        
        let negatives = numbers.filter { $0 < 0 }
        if !negatives.isEmpty {
            throw NegativeNumberError.negativesFound(negatives)
        }
        
        return numbers
    }
}
