//
//  ContentView.swift
//  DiceRoll
//
//  Created by Lin Ochoa on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 2
    @State private var numberOfSides: Int = 6
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Number of dice")
                    TextField("Number of dice", value: $numberOfDice, format: .number)
                    Text("Number of sides")
                    TextField("Number of dice sides", value: $numberOfSides, format: .number)
                        .keyboardType(.numberPad)
                }
                Section {
                    NavigationLink("Lets Roll!") {
                        RollView(numberOfDice: numberOfDice, numberOfSides: numberOfSides)
                    }
                }
                
            }
            .navigationTitle("Dice Roll Game")
        }
    }
}

#Preview {
    ContentView()
}
