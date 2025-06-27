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
        NavigationStack {
            VStack(spacing: 20) {
                Text("\(viewModel.result)")
                    .font(.title2)
                    .padding(.all)
                
                TextField("Enter numbers", text: $viewModel.input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Calculate") {
                    viewModel.calculate()
                }
                .frame(width: 80, height: 35, alignment: .center)
                .padding(.all, 4)
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .navigationTitle("String Calculator")
        }
    }
}

#Preview {
    ContentView()
}
