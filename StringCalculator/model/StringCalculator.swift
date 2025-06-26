//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import Foundation

struct StringCalculator {
    
    func add(_ input: String) throws -> Int {
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return 0 }
        return Int(trimmed) ?? 0
    }
}

