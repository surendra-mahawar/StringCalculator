//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import Foundation

struct StringCalculator {
    
    func add(_ input: String) throws -> Int {
        return input.isEmpty ? 0 : Int(input) ?? 0
    }
}

