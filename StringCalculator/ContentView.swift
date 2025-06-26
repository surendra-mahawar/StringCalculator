//
//  ContentView.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var input: String = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter numbers", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Calculate") {
                do {
                    let calc = StringCalculator()
                    let sum = try calc.add(input)
                    result = "\(sum)"
                } catch {
                    result = "Error: \(error.localizedDescription)"
                }
            }
            
            Text("Result: \(result)")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
