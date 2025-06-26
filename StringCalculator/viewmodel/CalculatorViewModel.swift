//
//  CalculatorViewModel.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    
    @Published var input: String = ""
    @Published var result: String = ""
    
    func calculate() {
        let sanitized = input.replacingOccurrences(of: "\\n", with: "\n")
        let calculator = StringCalculator()
        
        do {
            let sum = try calculator.add(sanitized)
            result = "Sum: \(sum)"
        } catch {
            result = error.localizedDescription
        }
    }
}
