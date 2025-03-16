//
//  RollView.swift
//  DiceRoll
//
//  Created by Lin Ochoa on 3/11/25.
//

import SwiftUI

struct RollView: View {
    var numberOfDice: Int
    var numberOfSides: Int
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
                        VStack{
                            Text("Dice \(index + 1)")
                            Text("\(rollOutcomes[index])")
                        }
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
        for _ in 1...numberOfDice {
            rollOutcomes.append(Int.random(in: 1...numberOfSides))
        }
    }
    
    func findTotal() -> Int {
        return rollOutcomes.reduce(0, +)
    }
}

#Preview {
    RollView(numberOfDice: 2, numberOfSides: 3)
}
