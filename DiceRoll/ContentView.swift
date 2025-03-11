//
//  ContentView.swift
//  DiceRoll
//
//  Created by Lin Ochoa on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfSides: Int = 6
    @State private var numberOfRolls: Int = 1
    @State private var numberOfDice: Int = 1
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Number of sides")
                    TextField("Number of dice sides", value: $numberOfSides, format: .number)
                        .keyboardType(.numberPad)
                    Text("Number of rolls")
                    TextField("Number of rolls", value: $numberOfRolls, format: .number)
                        .keyboardType(.numberPad)
                }
                Section {
                    NavigationLink("Lets Roll!") {
                        RollView(sides: numberOfSides, numberOfRolls: numberOfRolls)
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
