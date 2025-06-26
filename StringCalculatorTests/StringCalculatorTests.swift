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
    
    @Test
    func testNewlineAsDelimiter() async throws {
        let calculator = StringCalculator()
        #expect(try calculator.add("1\n2,3") == 6)
    }
    
    @Test
    func testCustomDelimiter() async throws {
        let calculator = StringCalculator()
        #expect(try calculator.add("//;\n1;2") == 3)
    }
    
    @Test
    func testNegativeNumbersThrowError() async throws {
        let calculator = StringCalculator()
        
        do {
            _ = try calculator.add("1,-2")
            #expect(Bool(false), "Expected to throw an error for negative numbers")
        } catch {
            #expect(error.localizedDescription.contains("-2"))
        }
    }
    
    
}
