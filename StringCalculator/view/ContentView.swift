//
//  ContentView.swift
//  StringCalculator
//
//  Created by XP India on 26/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter numbers", text: $viewModel.input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Calculate") {
                viewModel.calculate()
            }
            
            Text("Result: \(viewModel.result)")
                .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
