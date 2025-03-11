//
//  RollView.swift
//  DiceRoll
//
//  Created by Lin Ochoa on 3/11/25.
//

import SwiftUI

struct RollView: View {
    var sides: Int
    var numberOfRolls: Int
    @State private var rollOutcomes = [Int]()
    @State private var total: Int = 0
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(rollOutcomes.indices, id: \.self) { index in
                        Text("roll \(index): \(rollOutcomes[index])")
                    }
                }
            }
            Text("Total \(total)")
            
            Section {
                Text("Something here")
            }
        }
        .onAppear() {
            rollDice()
            total = findTotal()
        }
    }
    
    func rollDice() {
        for _ in 1...numberOfRolls {
            rollOutcomes.append(Int.random(in: 1...sides))
        }
    }
    
    func findTotal() -> Int {
        return rollOutcomes.reduce(0, +)
    }
}

#Preview {
    RollView(sides: 6, numberOfRolls: 3)
}
