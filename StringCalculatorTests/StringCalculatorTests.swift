//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by XP India on 26/06/25.
//

import Testing
@testable import StringCalculator

struct StringCalculatorTests {
    
    @Test
    func testEmptyStringReturnsZero() async throws {
        let calculator = StringCalculator()
        #expect(try calculator.add("") == 0)
    }
    
    @Test
    func testSingleNumberReturnsItself() async throws {
        let calculator = StringCalculator()
        #expect(try calculator.add("5") == 5)
    }
}
